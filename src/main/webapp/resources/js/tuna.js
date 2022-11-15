/**
 * @copyright (c) 2011, Yahoo! Inc.  All rights reserved.
 * @copyright (c) 2012, Log-Normal, Inc.  All rights reserved.
 * @copyright (c) 2012-2017, SOASTA, Inc. All rights reserved.
 * @copyright (c) 2017, Akamai Technologies, Inc. All rights reserved.
 * Copyrights licensed under the BSD License. See the accompanying LICENSE.txt file for terms.
 */

/**
 * @class BOOMR
 * @desc
 * boomerang measures various performance characteristics of your user's browsing
 * experience and beacons it back to your server.
 *
 * To use this you'll need a web site, lots of users and the ability to do
 * something with the data you collect.  How you collect the data is up to
 * you, but we have a few ideas.
 *
 * Everything in boomerang is accessed through the `BOOMR` object, which is
 * available on `window.BOOMR`.  It contains the public API, utility functions
 * ({@link BOOMR.utils}) and all of the plugins ({@link BOOMR.plugins}).
 *
 * Each plugin has its own API, but is reachable through {@link BOOMR.plugins}.
 *
 * ## Beacon Parameters
 *
 * The core boomerang object will add the following parameters to the beacon.
 *
 * Note that each individual {@link BOOMR.plugins plugin} will add its own
 * parameters as well.
 *
 * * `v`: Boomerang version
 * * `sv`: Boomerang Loader Snippet version
 * * `sm`: Boomerang Loader Snippet method
 * * `u`: The page's URL (for most beacons), or the `XMLHttpRequest` URL
 * * `pgu`: The page's URL (for `XMLHttpRequest` beacons)
 * * `pid`: Page ID (8 characters)
 * * `r`: Navigation referrer (from `document.location`)
 * * `vis.pre`: `1` if the page transitioned from prerender to visible
 * * `xhr.pg`: The `XMLHttpRequest` page group
 * * `errors`: Error messages of errors detected in Boomerang code, separated by a newline
 */

/**
 * @typedef TimeStamp
 * @type {number}
 *
 * @desc
 * A [Unix Epoch](https://en.wikipedia.org/wiki/Unix_time) timestamp (milliseconds
 * since 1970) created by [BOOMR.now()]{@link BOOMR.now}.
 *
 * If `DOMHighResTimeStamp` (`performance.now()`) is supported, it is
 * a `DOMHighResTimeStamp` (with microsecond resolution in the fractional),
 * otherwise, it is `Date.now()`.
 */


/**
 * @global
 * @type {TimeStamp}
 * @desc
 * Timestamp the boomerang.js script started executing.
 *
 * This has to be global so that we don't wait for this entire
 * script to download and execute before measuring the
 * time.  We also declare it without `var` so that we can later
 * `delete` it.  This is the only way that works on Internet Explorer.
 */
BOOMR_start = new Date().getTime();

/**
 * @function
 * @global
 * @desc
 * Check the value of `document.domain` and fix it if incorrect.
 *
 * This function is run at the top of boomerang, and then whenever
 * {@link BOOMR.init} is called.  If boomerang is running within an IFRAME, this
 * function checks to see if it can access elements in the parent
 * IFRAME.  If not, it will fudge around with `document.domain` until
 * it finds a value that works.
 *
 * This allows site owners to change the value of `document.domain` at
 * any point within their page's load process, and we will adapt to
 * it.
 *
 * @param {string} domain Domain name as retrieved from page URL
 */
function BOOMR_check_doc_domain(domain) {
	/*eslint no-unused-vars:0*/
	var test;


	if (!window) {
		return;
	}

	// If domain is not passed in, then this is a global call
	// domain is only passed in if we call ourselves, so we
	// skip the frame check at that point
	if (!domain) {
		// If we're running in the main window, then we don't need this
		if (window.parent === window || !document.getElementById("boomr-if-as")) {
			return;// true;	// nothing to do
		}

		if (window.BOOMR && BOOMR.boomerang_frame && BOOMR.window) {
			try {
				// If document.domain is changed during page load (from www.blah.com to blah.com, for example),
				// BOOMR.window.location.href throws "Permission Denied" in IE.
				// Resetting the inner domain to match the outer makes location accessible once again
				if (BOOMR.boomerang_frame.document.domain !== BOOMR.window.document.domain) {
					BOOMR.boomerang_frame.document.domain = BOOMR.window.document.domain;
				}
			}
			catch (err) {
				if (!BOOMR.isCrossOriginError(err)) {
					BOOMR.addError(err, "BOOMR_check_doc_domain.domainFix");
				}
			}
		}
		domain = document.domain;
	}

	if (!domain || domain.indexOf(".") === -1) {
		return;// false;	// not okay, but we did our best
	}

	// window.parent might be null if we're running during unload from
	// a detached iframe
	if (!window.parent) {
		return;
	}

	// 1. Test without setting document.domain
	try {
		test = window.parent.document;
		return;// test !== undefined;	// all okay
	}
	// 2. Test with document.domain
	catch (err) {
		try {
			document.domain = domain;
		}
		catch (err2) {
			// An exception might be thrown if the document is unloaded
			// or when the domain is incorrect.  If so, we can't do anything
			// more, so bail.
			return;
		}
	}

	try {
		test = window.parent.document;
		return;// test !== undefined;	// all okay
	}
	// 3. Strip off leading part and try again
	catch (err) {
		domain = domain.replace(/^[\w\-]+\./, "");
	}

	BOOMR_check_doc_domain(domain);
}

BOOMR_check_doc_domain();

// Construct BOOMR
// w is window
(function(w) {
	var impl, boomr, d, createCustomEvent, dispatchEvent, visibilityState, visibilityChange, orig_w = w;

	// If the window that boomerang is running in is not top level (ie, we're running in an iframe)
	// and if this iframe contains a script node with an id of "boomr-if-as",
	// Then that indicates that we are using the iframe loader, so the page we're trying to measure
	// is w.parent
	//
	// Note that we use `document` rather than `w.document` because we're specifically interested in
	// the document of the currently executing context rather than a passed in proxy.
	//
	// The only other place we do this is in `BOOMR.utils.getMyURL` below, for the same reason, we
	// need the full URL of the currently executing (boomerang) script.
	if (w.parent !== w &&
	    document.getElementById("boomr-if-as") &&
	    document.getElementById("boomr-if-as").nodeName.toLowerCase() === "script") {
		w = w.parent;
	}

	d = w.document;


	// Short namespace because I don't want to keep typing BOOMERANG
	if (!w.BOOMR) {
		w.BOOMR = {};
	}

	BOOMR = w.BOOMR;

	// don't allow this code to be included twice
	if (BOOMR.version) {
		return;
	}

    /**
     * TunA Code
     * * tuna_gxid is a array for stores tuna's gxid.
    */
    BOOMR.tuna_gxid = [];

	/**
	 * Boomerang version, formatted as major.minor.patchlevel.
	 *
	 * This variable is replaced during build (`grunt build`).
	 *
	 * @type {string}
	 *
	 * @memberof BOOMR
	 */
	BOOMR.version = "1.0.0";

	/**
	 * The main document window.
	 * * If Boomerang was loaded in an IFRAME, this is the parent window
	 * * If Boomerang was loaded inline, this is the current window
	 *
	 * @type {Window}
	 *
	 * @memberof BOOMR
	 */
	BOOMR.window = w;

	/**
	 * The Boomerang frame:
	 * * If Boomerang was loaded in an IFRAME, this is the IFRAME
	 * * If Boomerang was loaded inline, this is the current window
	 *
	 * @type {Window}
	 *
	 * @memberof BOOMR
	 */
	BOOMR.boomerang_frame = orig_w;

	/**
	 * @class BOOMR.plugins
	 * @desc
	 * Boomerang plugin namespace.
	 *
	 * All plugins should add their plugin object to `BOOMR.plugins`.
	 *
	 * A plugin should have, at minimum, the following exported functions:
	 * * `init(config)`
	 * * `is_complete()`
	 *
	 * See {@tutorial creating-plugins} for details.
	 */
	if (!BOOMR.plugins) {
		BOOMR.plugins = {};
	}

	BOOMR.initSended = false;

	// CustomEvent proxy for IE9 & 10 from https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent
	(function() {
		try {
			if (new w.CustomEvent("CustomEvent") !== undefined) {
				createCustomEvent = function(e_name, params) {
					return new w.CustomEvent(e_name, params);
				};
			}
		}
		catch (ignore) {
			// empty
		}

		try {
			if (!createCustomEvent && d.createEvent && d.createEvent("CustomEvent")) {
				createCustomEvent = function(e_name, params) {
					var evt = d.createEvent("CustomEvent");
					params = params || { cancelable: false, bubbles: false };
					evt.initCustomEvent(e_name, params.bubbles, params.cancelable, params.detail);

					return evt;
				};
			}
		}
		catch (ignore) {
			// empty
		}

		if (!createCustomEvent && d.createEventObject) {
			createCustomEvent = function(e_name, params) {
				var evt = d.createEventObject();
				evt.type = evt.propertyName = e_name;
				evt.detail = params.detail;

				return evt;
			};
		}

		if (!createCustomEvent) {
			createCustomEvent = function() { return undefined; };
		}
	}());

	/**
	 * Dispatch a custom event to the browser
	 * @param {string} e_name The custom event name that consumers can subscribe to
	 * @param {object} e_data Any data passed to subscribers of the custom event via the `event.detail` property
	 * @param {boolean} async By default, custom events are dispatched immediately.
	 * Set to true if the event should be dispatched once the browser has finished its current
	 * JavaScript execution.
	 */
	dispatchEvent = function(e_name, e_data, async) {
		var ev = createCustomEvent(e_name, {"detail": e_data});
		if (!ev) {
			return;
		}

		function dispatch() {
			try {
				if (d.dispatchEvent) {
					d.dispatchEvent(ev);
				}
				else if (d.fireEvent) {
					d.fireEvent("onpropertychange", ev);
				}
			}
			catch (e) {

			}
		}

		if (async) {
			BOOMR.setImmediate(dispatch);
		}
		else {
			dispatch();
		}
	};

	// visibilitychange is useful to detect if the page loaded through prerender
	// or if the page never became visible
	// http://www.w3.org/TR/2011/WD-page-visibility-20110602/
	// http://www.nczonline.net/blog/2011/08/09/introduction-to-the-page-visibility-api/
	// https://developer.mozilla.org/en-US/docs/Web/Guide/User_experience/Using_the_Page_Visibility_API

	// Set the name of the hidden property and the change event for visibility
	if (typeof d.hidden !== "undefined") {
		visibilityState = "visibilityState";
		visibilityChange = "visibilitychange";
	}
	else if (typeof d.mozHidden !== "undefined") {
		visibilityState = "mozVisibilityState";
		visibilityChange = "mozvisibilitychange";
	}
	else if (typeof d.msHidden !== "undefined") {
		visibilityState = "msVisibilityState";
		visibilityChange = "msvisibilitychange";
	}
	else if (typeof d.webkitHidden !== "undefined") {
		visibilityState = "webkitVisibilityState";
		visibilityChange = "webkitvisibilitychange";
	}

	// impl is a private object not reachable from outside the BOOMR object.
	// Users can set properties by passing in to the init() method.
	impl = {
		// xhrData
		// xhrData: "",

		// Beacon URL
		beacon_url: "",

		// Forces protocol-relative URLs to HTTPS
		beacon_url_force_https: true,

		// List of string regular expressions that must match the beacon_url.  If
		// not set, or the list is empty, all beacon URLs are allowed.
		beacon_urls_allowed: [],

		// Beacon request method, either GET, POST or AUTO. AUTO will check the
		// request size then use GET if the request URL is less than MAX_GET_LENGTH
		// chars. Otherwise, it will fall back to a POST request.
		beacon_type: "AUTO",

		// Beacon authorization key value. Most systems will use the 'Authentication'
		// keyword, but some some services use keys like 'X-Auth-Token' or other
		// custom keys.
		beacon_auth_key: "Authorization",

		// Beacon authorization token. This is only needed if your are using a POST
		// and the beacon requires an Authorization token to accept your data.  This
		// disables use of the browser sendBeacon() API.
		beacon_auth_token: undefined,

		// Sends beacons with Credentials (applies to XHR beacons, not IMG or `sendBeacon()`).
		// If you need this, you may want to enable `beacon_disable_sendbeacon` as
		// `sendBeacon()` does not support credentials.
		beacon_with_credentials: false,

		// Disables navigator.sendBeacon() support
		beacon_disable_sendbeacon: false,

		// Strip out everything except last two parts of hostname.
		// This doesn't work well for domains that end with a country tld,
		// but we allow the developer to override site_domain for that.
		// You can disable all cookies by setting site_domain to a falsy value.
		site_domain: w.location.hostname.
					replace(/.*?([^.]+\.[^.]+)\.?$/, "$1").
					toLowerCase(),

		// User's ip address determined on the server.  Used for the BW cookie.
		user_ip: "",

		// Whether or not to send beacons on page load
		autorun: true,

		// Whether or not we've sent a page load beacon
		hasSentPageLoadBeacon: false,

		// document.referrer
		r: undefined,

		// strip_query_string: false,

		// onloadfired: false,

		// handlers_attached: false,

		// waiting_for_config: false,

		events: {
			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when the page is usable by the user.
			 *
			 * By default this is fired when `window.onload` fires, but if you
			 * set `autorun` to false when calling {@link BOOMR.init}, then you
			 * must explicitly fire this event by calling {@link BOOMR#event:page_ready}.
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onload}
			 * @event BOOMR#page_ready
			 * @property {Event} [event] Event triggering the page_ready
			 */
			"page_ready": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired just before the browser unloads the page.
			 *
			 * The first event of `window.pagehide`, `window.beforeunload`,
			 * or `window.unload` will trigger this.
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/Events/pagehide}
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/API/WindowEventHandlers/onbeforeunload}
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/API/WindowEventHandlers/onunload}
			 * @event BOOMR#page_unload
			 */
			"page_unload": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired before the document is about to be unloaded.
			 *
			 * `window.beforeunload` will trigger this.
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/API/WindowEventHandlers/onbeforeunload}
			 * @event BOOMR#before_unload
			 */
			"before_unload": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired on `document.DOMContentLoaded`.
			 *
			 * The `DOMContentLoaded` event is fired when the initial HTML document
			 * has been completely loaded and parsed, without waiting for stylesheets,
			 * images, and subframes to finish loading
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/Events/DOMContentLoaded}
			 * @event BOOMR#dom_loaded
			 */
			"dom_loaded": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired on `document.visibilitychange`.
			 *
			 * The `visibilitychange` event is fired when the content of a tab has
			 * become visible or has been hidden.
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/Events/visibilitychange}
			 * @event BOOMR#visibility_changed
			 */
			"visibility_changed": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when the `visibilityState` of the document has changed from
			 * `prerender` to `visible`
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/Events/visibilitychange}
			 * @event BOOMR#prerender_to_visible
			 */
			"prerender_to_visible": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when a beacon is about to be sent.
			 *
			 * The subscriber can still add variables to the beacon at this point,
			 * either by modifying the `vars` paramter or calling {@link BOOMR.addVar}.
			 *
			 * @event BOOMR#before_beacon
			 * @property {object} vars Beacon variables
			 */
			"before_beacon": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when a beacon was sent.
			 *
			 * The beacon variables cannot be modified at this point.  Any calls
			 * to {@link BOOMR.addVar} or {@link BOOMR.removeVar} will apply to the
			 * next beacon.
			 *
			 * Also known as `onbeacon`.
			 *
			 * @event BOOMR#beacon
			 * @property {object} vars Beacon variables
			 */
			"beacon": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when the page load beacon has been sent.
			 *
			 * This event should only happen once on a page.  It does not apply
			 * to SPA soft navigations.
			 *
			 * @event BOOMR#page_load_beacon
			 * @property {object} vars Beacon variables
			 */
			"page_load_beacon": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when an XMLHttpRequest has finished, or, if something calls
			 * {@link BOOMR.responseEnd}.
			 *
			 * @event BOOMR#xhr_load
			 * @property {object} data Event data
			 */
			"xhr_load": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when the `click` event has happened on the `document`.
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onclick}
			 * @event BOOMR#click
			 */
			"click": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired when any `FORM` element is submitted.
			 *
			 * @see {@link https://developer.mozilla.org/en-US/docs/Web/API/HTMLFormElement/submit}
			 * @event BOOMR#form_submit
			 */
			"form_submit": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever new configuration data is applied via {@link BOOMR.init}.
			 *
			 * Also known as `onconfig`.
			 *
			 * @event BOOMR#config
			 * @property {object} data Configuration data
			 */
			"config": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever `XMLHttpRequest.open` is called.
			 *
			 * This event will only happen if {@link BOOMR.plugins.AutoXHR} is enabled.
			 *
			 * @event BOOMR#xhr_init
			 * @property {string} type XHR type ("xhr")
			 */
			"xhr_init": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever a SPA plugin is about to track a new navigation.
			 *
			 * @event BOOMR#spa_init
			 * @property {string} navType Navigation type (`spa` or `spa_hard`)
			 * @property {object} param SPA navigation parameters
			 */
			"spa_init": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever a SPA navigation is complete.
			 *
			 * @event BOOMR#spa_navigation
			 */
			"spa_navigation": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever a SPA navigation is cancelled.
			 *
			 * @event BOOMR#spa_cancel
			 */
			"spa_cancel": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever `XMLHttpRequest.send` is called.
			 *
			 * This event will only happen if {@link BOOMR.plugins.AutoXHR} is enabled.
			 *
			 * @event BOOMR#xhr_send
			 * @property {object} xhr `XMLHttpRequest` object
			 */
			"xhr_send": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever and `XMLHttpRequest` has an error (if its `status` is
			 * set).
			 *
			 * This event will only happen if {@link BOOMR.plugins.AutoXHR} is enabled.
			 *
			 * Also known as `onxhrerror`.
			 *
			 * @event BOOMR#xhr_error
			 * @property {object} data XHR data
			 */
			"xhr_error": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever a page error has happened.
			 *
			 * This event will only happen if {@link BOOMR.plugins.Errors} is enabled.
			 *
			 * Also known as `onerror`.
			 *
			 * @event BOOMR#error
			 * @property {object} err Error
			 */
			"error": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever connection information changes via the
			 * Network Information API.
			 *
			 * This event will only happen if {@link BOOMR.plugins.Mobile} is enabled.
			 *
			 * @event BOOMR#netinfo
			 * @property {object} connection `navigator.connection`
			 */
			"netinfo": [],

			/**
			 * Boomerang event, subscribe via {@link BOOMR.subscribe}.
			 *
			 * Fired whenever a Rage Click is detected.
			 *
			 * This event will only happen if {@link BOOMR.plugins.Continuity} is enabled.
			 *
			 * @event BOOMR#rage_click
			 * @property {Event} e Event
			 */
			"rage_click": []
		},

		/**
		 * Public events
		 */
		public_events: {
			/**
			 * Public event (fired on `document`), and can be subscribed via
			 * `document.addEventListener("onBeforeBoomerangBeacon", ...)` or
			 * `document.attachEvent("onpropertychange", ...)`.
			 *
			 * Maps to {@link BOOMR#event:before_beacon}
			 *
			 * @event document#onBeforeBoomerangBeacon
			 * @property {object} vars Beacon variables
			 */
			"before_beacon": "onBeforeBoomerangBeacon",

			/**
			 * Public event (fired on `document`), and can be subscribed via
			 * `document.addEventListener("onBoomerangBeacon", ...)` or
			 * `document.attachEvent("onpropertychange", ...)`.
			 *
			 * Maps to {@link BOOMR#event:before_beacon}
			 *
			 * @event document#onBoomerangBeacon
			 * @property {object} vars Beacon variables
			 */
			"beacon": "onBoomerangBeacon",

			/**
			 * Public event (fired on `document`), and can be subscribed via
			 * `document.addEventListener("onBoomerangLoaded", ...)` or
			 * `document.attachEvent("onpropertychange", ...)`.
			 *
			 * Fired when {@link BOOMR} has loaded and can be used.
			 *
			 * @event document#onBoomerangLoaded
			 */
			"onboomerangloaded": "onBoomerangLoaded"
		},

		/**
		 * Maps old event names to their updated name
		 */
		translate_events: {
			"onbeacon": "beacon",
			"onconfig": "config",
			"onerror": "error",
			"onxhrerror": "xhr_error"
		},

		/**
		 * Number of page_unload or before_unload callbacks registered
		 */
		unloadEventsCount: 0,

		/**
		 * Number of page_unload or before_unload callbacks called
		 */
		unloadEventCalled: 0,

		listenerCallbacks: {},

		vars: {},
		singleBeaconVars: {},

		/**
		 * Variable priority lists:
		 * -1 = first
		 *  1 = last
		 */
		varPriority: {
			"-1": {},
			"1": {}
		},

		errors: {},

		disabled_plugins: {},

		localStorageSupported: false,
		LOCAL_STORAGE_PREFIX: "_boomr_",

		/**
		 * Native functions that were overwritten and should be restored when
		 * the Boomerang IFRAME is unloaded
		 */
		nativeOverwrites: [],

		xb_handler: function(type) {
			return function(ev) {
				var target;
				if (!ev) { ev = w.event; }
				if (ev.target) { target = ev.target; }
				else if (ev.srcElement) { target = ev.srcElement; }
				if (target.nodeType === 3) {  // defeat Safari bug
					target = target.parentNode;
				}

				// don't capture events on flash objects
				// because of context slowdowns in PepperFlash
				if (target &&
				    target.nodeName &&
				    target.nodeName.toUpperCase() === "OBJECT" &&
				    target.type === "application/x-shockwave-flash") {
					return;
				}
				impl.fireEvent(type, target);
			};
		},

		clearEvents: function() {
			var eventName;

			for (eventName in this.events) {
				if (this.events.hasOwnProperty(eventName)) {
					this.events[eventName] = [];
				}
			}
		},

		clearListeners: function() {
			var type, i;

			for (type in impl.listenerCallbacks) {
				if (impl.listenerCallbacks.hasOwnProperty(type)) {
					// remove all callbacks -- removeListener is guaranteed
					// to remove the element we're calling with
					while (impl.listenerCallbacks[type].length) {
						BOOMR.utils.removeListener(
						    impl.listenerCallbacks[type][0].el,
						    type,
						    impl.listenerCallbacks[type][0].fn);
					}
				}
			}

			impl.listenerCallbacks = {};
		},

		fireEvent: function(e_name, data) {
			var i, handler, handlers, handlersLen;

			e_name = e_name.toLowerCase();


			// translate old names
			if (this.translate_events[e_name]) {
				e_name = this.translate_events[e_name];
			}

			if (!this.events.hasOwnProperty(e_name)) {
				return;// false;
			}

			if (this.public_events.hasOwnProperty(e_name)) {
				dispatchEvent(this.public_events[e_name], data);
			}

			handlers = this.events[e_name];

			// Before we fire any event listeners, let's call real_sendBeacon() to flush
			// any beacon that is being held by the setImmediate.
			if (e_name !== "before_beacon" && e_name !== "beacon") {
				BOOMR.real_sendBeacon();
			}

			// only call handlers at the time of fireEvent (and not handlers that are
			// added during this callback to avoid an infinite loop)
			handlersLen = handlers.length;
			for (i = 0; i < handlersLen; i++) {
				try {
					handler = handlers[i];
					handler.fn.call(handler.scope, data, handler.cb_data);
				}
				catch (err) {
					BOOMR.addError(err, "fireEvent." + e_name + "<" + i + ">");
				}
			}

			// remove any 'once' handlers now that we've fired all of them
			for (i = 0; i < handlersLen; i++) {
				if (handlers[i].once) {
					handlers.splice(i, 1);
					handlersLen--;
					i--;
				}
			}


			return;// true;
		},

		spaNavigation: function() {
			// a SPA navigation occured, force onloadfired to true
			impl.onloadfired = true;
		},

		/**
		 * Determines whether a beacon URL is allowed based on
		 * `beacon_urls_allowed` config
		 *
		 * @param {string} url URL to test
		 *
		 */
		beaconUrlAllowed: function(url) {
			if (!impl.beacon_urls_allowed || impl.beacon_urls_allowed.length === 0) {
				return true;
			}

			for (var i = 0; i < impl.beacon_urls_allowed.length; i++) {
				var regEx = new RegExp(impl.beacon_urls_allowed[i]);
				if (regEx.exec(url)) {
					return true;
				}
			}

			return false;
		},

		/**
		 * Checks browser for localStorage support
		 */
		checkLocalStorageSupport: function() {
			var name = impl.LOCAL_STORAGE_PREFIX + "clss";
			impl.localStorageSupported = false;

			// Browsers with cookies disabled or in private/incognito mode may throw an
			// error when accessing the localStorage variable
			try {
				// we need JSON and localStorage support
				if (!w.JSON || !w.localStorage) {
					return;
				}

				w.localStorage.setItem(name, name);
				impl.localStorageSupported = (w.localStorage.getItem(name) === name);
				w.localStorage.removeItem(name);
			}
			catch (ignore) {
				impl.localStorageSupported = false;
			}
		},

		/**
		 * Fired when the Boomerang IFRAME is unloaded.
		 *
		 * If Boomerang was loaded into the root document, this code
		 * will not run.
		 */
		onFrameUnloaded: function() {
			var i, prop;

			BOOMR.isUnloaded = true;

			// swap the original function back in for any overwrites
			for (i = 0; i < impl.nativeOverwrites.length; i++) {
				prop = impl.nativeOverwrites[i];

				prop.obj[prop.functionName] = prop.origFn;
			}

			impl.nativeOverwrites = [];
		}
	};

	// We create a boomr object and then copy all its properties to BOOMR so that
	// we don't overwrite anything additional that was added to BOOMR before this
	// was called... for example, a plugin.
	boomr = {
		/**
		 * The timestamp when boomerang.js showed up on the page.
		 *
		 * This is the value of `BOOMR_start` we set earlier.
		 * @type {TimeStamp}
		 *
		 * @memberof BOOMR
		 */
		t_start: BOOMR_start,

		/**
		 * When the Boomerang plugins have all run.
		 *
		 * This value is generally set in zzz-last-plugin.js.
		 * @type {TimeStamp}
		 *
		 * @memberof BOOMR
		 */
		t_end: undefined,

		/**
		 * URL of boomerang.js.
		 *
		 * @type {string}
		 *
		 * @memberof BOOMR
		 */
		url: "",

		/**
		 * (Optional) URL of configuration file
		 *
		 * @type {string}
		 *
		 * @memberof BOOMR
		 */
		config_url: null,

		/**
		 * Whether or not Boomerang was loaded after the `onload` event.
		 *
		 * @type {boolean}
		 *
		 * @memberof BOOMR
		 */
		loadedLate: false,

		/**
		 * Current number of beacons sent.
		 *
		 * Will be incremented and added to outgoing beacon as `n`.
		 *
		 * @type {number}
		 *
		 */
		beaconsSent: 0,

		/**
		 * Whether or not Boomerang thinks it has been unloaded (if it was
		 * loaded in an IFRAME)
		 *
		 * @type {boolean}
		 */
		isUnloaded: false,

		/**
		 * Whether or not we're in the middle of building a beacon.
		 *
		 * If so, the code desiring to send a beacon should wait until the beacon
		 * event and try again.  At that point, it should set this flag to true.
		 *
		 * @type {boolean}
		 */
		beaconInQueue: false,

		/**
		 * Constants visible to the world
		 * @class BOOMR.constants
		 */
		constants: {
			/**
			 * SPA beacon types
			 *
			 * @type {string[]}
			 *
			 * @memberof BOOMR.constants
			 */
			BEACON_TYPE_SPAS: ["spa", "spa_hard"],

			/**
			 * Maximum GET URL length.
			 * Using 2000 here as a de facto maximum URL length based on:
 			 * http://stackoverflow.com/questions/417142/what-is-the-maximum-length-of-a-url-in-different-browsers
			 *
			 * @type {number}
			 *
			 * @memberof BOOMR.constants
			 */
			MAX_GET_LENGTH: 2000
		},

		/**
		 * Session data
		 * @class BOOMR.session
		 */
		session: {
			/**
			 * Session Domain.
			 *
			 * You can disable all cookies by setting site_domain to a falsy value.
			 *
			 * @type {string}
			 *
			 * @memberof BOOMR.session
			 */
			domain: impl.site_domain,

			/**
			 * Session ID.  This will be randomly generated in the client but may
			 * be overwritten by the server if not set.
			 *
			 * @type {string}
			 *
			 * @memberof BOOMR.session
			 */
			ID: Math.random().toString(36).replace(/^0\./, ""),

			/**
			 * Session start time.
			 *
			 * @type {TimeStamp}
			 *
			 * @memberof BOOMR.session
			 */
			start: undefined,

			/**
			 * Session length (number of pages)
			 *
			 * @type {number}
			 *
			 * @memberof BOOMR.session
			 */
			length: 0,

			/**
			 * Session enabled (Are session cookies enabled?)
			 *
			 * @type {boolean}
			 *
			 * @memberof BOOMR.session
			 */
			enabled: true
		},

		/**
		 * @class BOOMR.utils
		 */
		utils: {
			/**
			 * Determines whether or not the browser has `postMessage` support
			 *
			 * @returns {boolean} True if supported
			 */
			hasPostMessageSupport: function() {
				if (!w.postMessage || typeof w.postMessage !== "function" && typeof w.postMessage !== "object") {
					return false;
				}
				return true;
			},

			/**
			 * Converts an object to a string.
			 *
			 * @param {object} o Object
			 * @param {string} separator Member separator
			 * @param {number} nest_level Number of levels to recurse
			 *
			 * @returns {string} String representation of the object
			 *
			 * @memberof BOOMR.utils
			 */
			objectToString: function(o, separator, nest_level) {
				var value = [], k;

				if (!o || typeof o !== "object") {
					return o;
				}
				if (separator === undefined) {
					separator = "\n\t";
				}
				if (!nest_level) {
					nest_level = 0;
				}

				if (BOOMR.utils.isArray(o)) {
					for (k = 0; k < o.length; k++) {
						if (nest_level > 0 && o[k] !== null && typeof o[k] === "object") {
							value.push(
								this.objectToString(
									o[k],
									separator + (separator === "\n\t" ? "\t" : ""),
									nest_level - 1
								)
							);
						}
						else {
							if (separator === "&") {
								value.push(encodeURIComponent(o[k]));
							}
							else {
								value.push(o[k]);
							}
						}
					}
					separator = ",";
				}
				else {
					for (k in o) {
						if (Object.prototype.hasOwnProperty.call(o, k)) {
							if (nest_level > 0 && o[k] !== null && typeof o[k] === "object") {
								value.push(encodeURIComponent(k) + "=" +
									this.objectToString(
										o[k],
										separator + (separator === "\n\t" ? "\t" : ""),
										nest_level - 1
									)
								);
							}
							else {
								if (separator === "&") {
									value.push(encodeURIComponent(k) + "=" + encodeURIComponent(o[k]));
								}
								else {
									value.push(k + "=" + o[k]);
								}
							}
						}
					}
				}

				return value.join(separator);
			},

			/**
			 * Gets the value of the cookie identified by `name`.
			 *
			 * @param {string} name Cookie name
			 *
			 * @returns {string|null} Cookie value, if set.
			 *
			 * @memberof BOOMR.utils
			 */
			getCookie: function(name) {
				if (!name) {
					return null;
				}


				name = " " + name + "=";

				var i, cookies;
				cookies = " " + d.cookie + ";";
				if ((i = cookies.indexOf(name)) >= 0) {
					i += name.length;
					cookies = cookies.substring(i, cookies.indexOf(";", i)).replace(/^"/, "").replace(/"$/, "");
					return cookies;
				}
			},

			/**
			 * Sets the cookie named `name` to the serialized value of `subcookies`.
			 *
			 * @param {string} name The name of the cookie
			 * @param {object} subcookies Key/value pairs to write into the cookie.
			 * These will be serialized as an & separated list of URL encoded key=value pairs.
			 * @param {number} max_age Lifetime in seconds of the cookie.
			 * Set this to 0 to create a session cookie that expires when
			 * the browser is closed. If not set, defaults to 0.
			 *
			 * @returns {boolean} True if the cookie was set successfully
			 *
			 * @example
			 * BOOMR.utils.setCookie("RT", { s: t_start, r: url });
			 *
			 * @memberof BOOMR.utils
			 */
			setCookie: function(name, subcookies, max_age) {
				var value, nameval, savedval, c, exp;

				if (!name || !BOOMR.session.domain || typeof subcookies === "undefined") {


					BOOMR.addVar("nocookie", 1);
					return false;
				}


				value = this.objectToString(subcookies, "&");
				nameval = name + "=\"" + value + "\"";

				if (nameval.length < 500) {
					c = [nameval, "path=/", "domain=" + BOOMR.session.domain];
					if (typeof max_age === "number") {
						exp = new Date();
						exp.setTime(exp.getTime() + max_age * 1000);
						exp = exp.toGMTString();
						c.push("expires=" + exp);
					}

					d.cookie = c.join("; ");
					// confirm cookie was set (could be blocked by user's settings, etc.)
					savedval = this.getCookie(name);
					// the saved cookie should be the same or undefined in the case of removeCookie
					if (value === savedval ||
					    (typeof savedval === "undefined" && typeof max_age === "number" && max_age <= 0)) {
						return true;
					}
					BOOMR.warn("Saved cookie value doesn't match what we tried to set:\n" + value + "\n" + savedval);
				}
				else {
					BOOMR.warn("Cookie too long: " + nameval.length + " " + nameval);
				}

				BOOMR.addVar("nocookie", 1);
				return false;
			},

			/**
			 * Parse a cookie string returned by {@link BOOMR.utils.getCookie} and
			 * split it into its constituent subcookies.
			 *
			 * @param {string} cookie Cookie value
			 *
			 * @returns {object} On success, an object of key/value pairs of all
			 * sub cookies. Note that some subcookies may have empty values.
			 * `null` if `cookie` was not set or did not contain valid subcookies.
			 *
			 * @memberof BOOMR.utils
			 */
			getSubCookies: function(cookie) {
				var cookies_a,
				    i, l, kv,
				    gotcookies = false,
				    cookies = {};

				if (!cookie) {
					return null;
				}

				if (typeof cookie !== "string") {

					return null;
				}

				cookies_a = cookie.split("&");

				for (i = 0, l = cookies_a.length; i < l; i++) {
					kv = cookies_a[i].split("=");
					if (kv[0]) {
						kv.push("");  // just in case there's no value
						cookies[decodeURIComponent(kv[0])] = decodeURIComponent(kv[1]);
						gotcookies = true;
					}
				}

				return gotcookies ? cookies : null;
			},

			/**
			 * Removes the cookie identified by `name` by nullifying its value,
			 * and making it a session cookie.
			 *
			 * @param {string} name Cookie name
			 *
			 * @memberof BOOMR.utils
			 */
			removeCookie: function(name) {
				return this.setCookie(name, {}, -86400);
			},

			/**
			 * Retrieve items from localStorage
			 *
			 * @param {string} name Name of storage
			 *
			 * @returns {object|null} Returns object retrieved from localStorage.
			 *                       Returns undefined if not found or expired.
			 *                       Returns null if parameters are invalid or an error occured
			 *
			 * @memberof BOOMR.utils
			 */
			getLocalStorage: function(name) {
				var value, data;
				if (!name || !impl.localStorageSupported) {
					return null;
				}


				try {
					value = w.localStorage.getItem(impl.LOCAL_STORAGE_PREFIX + name);
					if (value === null) {
						return undefined;
					}
					data = w.JSON.parse(value);
				}
				catch (e) {
					BOOMR.warn(e);
					return null;
				}

				if (!data || typeof data.items !== "object") {
					// Items are invalid
					this.removeLocalStorage(name);
					return null;
				}
				if (typeof data.expires === "number") {
					if (BOOMR.now() >= data.expires) {
						// Items are expired
						this.removeLocalStorage(name);
						return undefined;
					}
				}
				return data.items;
			},

			/**
			 * Saves items in localStorage
			 * The value stored in localStorage will be a JSON string representation of {"items": items, "expiry": expiry}
			 * where items is the object we're saving and expiry is an optional epoch number of when the data is to be
			 * considered expired
			 *
			 * @param {string} name Name of storage
			 * @param {object} items Items to be saved
			 * @param {number} max_age Age in seconds before items are to be considered expired
			 *
			 * @returns {boolean} True if the localStorage was set successfully
			 *
			 * @memberof BOOMR.utils
			 */
			setLocalStorage: function(name, items, max_age) {
				var data, value, savedval;

				if (!name || !impl.localStorageSupported || typeof items !== "object") {
					return false;
				}


				data = {"items": items};

				if (typeof max_age === "number") {
					data.expires = BOOMR.now() + (max_age * 1000);
				}

				value = w.JSON.stringify(data);

				if (value.length < 50000) {
					try {
						w.localStorage.setItem(impl.LOCAL_STORAGE_PREFIX + name, value);
						// confirm storage was set (could be blocked by user's settings, etc.)
						savedval = w.localStorage.getItem(impl.LOCAL_STORAGE_PREFIX + name);
						if (value === savedval) {
							return true;
						}
					}
					catch (ignore) {
						// Empty
					}
					BOOMR.warn("Saved storage value doesn't match what we tried to set:\n" + value + "\n" + savedval);
				}
				else {
					BOOMR.warn("Storage items too large: " + value.length + " " + value);
				}

				return false;
			},

			/**
			 * Remove items from localStorage
			 *
			 * @param {string} name Name of storage
			 *
			 * @returns {boolean} True if item was removed from localStorage.
			 *
			 * @memberof BOOMR.utils
			 */
			removeLocalStorage: function(name) {
				if (!name || !impl.localStorageSupported) {
					return false;
				}
				try {
					w.localStorage.removeItem(impl.LOCAL_STORAGE_PREFIX + name);
					return true;
				}
				catch (ignore) {
					// Empty
				}
				return false;
			},

			/**
			 * Cleans up a URL by removing the query string (if configured), and
			 * limits the URL to the specified size.
			 *
			 * @param {string} url URL to clean
			 * @param {number} urlLimit Maximum size, in characters, of the URL
			 *
			 * @returns {string} Cleaned up URL
			 *
			 * @memberof BOOMR.utils
			 */
			cleanupURL: function(url, urlLimit) {
				if (!url || BOOMR.utils.isArray(url)) {
					return "";
				}

				if (impl.strip_query_string) {
					url = url.replace(/\?.*/, "?qs-redacted");
				}

				if (typeof urlLimit !== "undefined" && url && url.length > urlLimit) {
					// We need to break this URL up.  Try at the query string first.
					var qsStart = url.indexOf("?");
					if (qsStart !== -1 && qsStart < urlLimit) {
						url = url.substr(0, qsStart) + "?...";
					}
					else {
						// No query string, just stop at the limit
						url = url.substr(0, urlLimit - 3) + "...";
					}
				}

				return url;
			},

			/**
			 * Gets the URL with the query string replaced with a MD5 hash of its contents.
			 *
			 * @param {string} url URL
			 * @param {boolean} stripHash Whether or not to strip the hash
			 *
			 * @returns {string} URL with query string hashed
			 *
			 * @memberof BOOMR.utils
			 */
			hashQueryString: function(url, stripHash) {
				if (!url) {
					return url;
				}
				if (!url.match) {
					BOOMR.addError("TypeError: Not a string", "hashQueryString", typeof url);
					return "";
				}
				if (url.match(/^\/\//)) {
					url = location.protocol + url;
				}
				if (!url.match(/^(https?|file):/)) {
					BOOMR.error("Passed in URL is invalid: " + url);
					return "";
				}
				if (stripHash) {
					url = url.replace(/#.*/, "");
				}
				if (!BOOMR.utils.MD5) {
					return url;
				}
				return url.replace(/\?([^#]*)/, function(m0, m1) {
					return "?" + (m1.length > 10 ? BOOMR.utils.MD5(m1) : m1);
				});
			},

			/**
			 * Sets the object's properties if anything in config matches
			 * one of the property names.
			 *
			 * @param {object} o The plugin's `impl` object within which it stores
			 * all its configuration and private properties
			 * @param {object} config The config object passed in to the plugin's
			 * `init()` method.
			 * @param {string} plugin_name The plugin's name in the {@link BOOMR.plugins} object.
			 * @param {string[]} properties An array containing a list of all configurable
			 * properties that this plugin has.
			 *
			 * @returns {boolean} True if a property was set
			 *
			 * @memberof BOOMR.utils
			 */
			pluginConfig: function(o, config, plugin_name, properties) {
				var i, props = 0;

				if (!config || !config[plugin_name]) {
					return false;
				}

				for (i = 0; i < properties.length; i++) {
					if (config[plugin_name][properties[i]] !== undefined) {
						o[properties[i]] = config[plugin_name][properties[i]];
						props++;
					}
				}

				return (props > 0);
			},

			/**
			 * `filter` for arrays
			 *
			 * @param {Array} array The array to iterate over.
			 * @param {Function} predicate The function invoked per iteration.
			 *
			 * @returns {Array} Returns the new filtered array.
			 *
			 * @memberof BOOMR.utils
			 */
			arrayFilter: function(array, predicate) {
				var result = [];

				if (!(this.isArray(array) || (array && typeof array.length === "number")) ||
				    typeof predicate !== "function") {
					return result;
				}

				if (typeof array.filter === "function") {
					result = array.filter(predicate);
				}
				else {
					var index = -1,
					    length = array.length,
					    value;

					while (++index < length) {
						value = array[index];
						if (predicate(value, index, array)) {
							result[result.length] = value;
						}
					}
				}
				return result;
			},

			/**
			 * `find` for Arrays
			 *
			 * @param {Array} array The array to iterate over
			 * @param {Function} predicate The function invoked per iteration
			 *
			 * @returns {Array} Returns the value of first element that satisfies
			 * the predicate
			 *
			 * @memberof BOOMR.utils
			 */
			arrayFind: function(array, predicate) {
				if (!(this.isArray(array) || (array && typeof array.length === "number")) ||
				    typeof predicate !== "function") {
					return undefined;
				}

				if (typeof array.find === "function") {
					return array.find(predicate);
				}
				else {
					var index = -1,
					    length = array.length,
					    value;

					while (++index < length) {
						value = array[index];
						if (predicate(value, index, array)) {
							return value;
						}
					}
					return undefined;
				}
			},

			/**
			 * MutationObserver feature detection
			 *
			 * @returns {boolean} Returns true if MutationObserver is supported.
			 * Always returns false for IE 11 due several bugs in it's implementation that MS flagged as Won't Fix.
			 * In IE11, XHR responseXML might be malformed if MO is enabled (where extra newlines get added in nodes with UTF-8 content).
			 * Another IE 11 MO bug can cause the process to crash when certain mutations occur.
			 * For the process crash issue, see https://developer.microsoft.com/en-us/microsoft-edge/platform/issues/8137215/ and
			 * https://developer.microsoft.com/en-us/microsoft-edge/platform/issues/15167323/
			 *
			 * @memberof BOOMR.utils
			 */
			isMutationObserverSupported: function() {
				// We can only detect IE 11 bugs by UA sniffing.
				var ie11 = (w && w.navigator && w.navigator.userAgent && w.navigator.userAgent.match(/Trident.*rv[ :]*11\./));
				return (!ie11 && w && w.MutationObserver && typeof w.MutationObserver === "function");
			},

			/**
			 * The callback function may return a falsy value to disconnect the
			 * observer after it returns, or a truthy value to keep watching for
			 * mutations. If the return value is numeric and greater than 0, then
			 * this will be the new timeout. If it is boolean instead, then the
			 * timeout will not fire any more so the caller MUST call disconnect()
			 * at some point.
			 *
			 * @callback BOOMR~addObserverCallback
			 * @param {object[]} mutations List of mutations detected by the observer or `undefined` if the observer timed out
			 * @param {object} callback_data Is the passed in `callback_data` parameter without modifications
			 */

			/**
			 * Add a MutationObserver for a given element and terminate after `timeout`ms.
			 *
			 * @param {DOMElement} el DOM element to watch for mutations
			 * @param {MutationObserverInit} config MutationObserverInit object (https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver#MutationObserverInit)
			 * @param {number} timeout Number of milliseconds of no mutations after which the observer should be automatically disconnected.
			 * If set to a falsy value, the observer will wait indefinitely for Mutations.
			 * @param {BOOMR~addObserverCallback} callback Callback function to call either on timeout or if mutations are detected.
			 * @param {object} callback_data Any data to be passed to the callback function as its second parameter.
			 * @param {object} callback_ctx An object that represents the `this` object of the `callback` method.
			 * Leave unset the callback function is not a method of an object.
			 *
			 * @returns {object|null}
			 * - `null` if a MutationObserver could not be created OR
			 * - An object containing the observer and the timer object:
			 *   `{ observer: <MutationObserver>, timer: <Timeout Timer if any> }`
			 * - The caller can use this to disconnect the observer at any point
			 *   by calling `retval.observer.disconnect()`
			 * - Note that the caller should first check to see if `retval.observer`
			 *   is set before calling `disconnect()` as it may have been cleared automatically.
			 *
			 * @memberof BOOMR.utils
			 */
			addObserver: function(el, config, timeout, callback, callback_data, callback_ctx) {
				var MO, zs, o = {observer: null, timer: null};


				if (!this.isMutationObserverSupported() || !callback || !el) {
					return null;
				}

				function done(mutations) {
					var run_again = false;


					if (o.timer) {
						clearTimeout(o.timer);
						o.timer = null;
					}

					if (callback) {
						run_again = callback.call(callback_ctx, mutations, callback_data);

						if (!run_again) {
							callback = null;
						}
					}

					if (!run_again && o.observer) {
						o.observer.disconnect();
						o.observer = null;
					}

					if (typeof run_again === "number" && run_again > 0) {
						o.timer = setTimeout(done, run_again);
					}
				}

				MO = w.MutationObserver;
				// if the site uses Zone.js then get the native MutationObserver
				if (w.Zone && typeof w.Zone.__symbol__ === "function") {
					zs = w.Zone.__symbol__("MutationObserver");
					if (zs && typeof zs === "string" && w.hasOwnProperty(zs) && typeof w[zs] === "function") {

						MO = w[zs];
					}
				}
				o.observer = new MO(done);

				if (timeout) {
					o.timer = setTimeout(done, o.timeout);
				}

				o.observer.observe(el, config);

				return o;
			},

			/**
			 * Adds an event listener.
			 *
			 * @param {DOMElement} el DOM element
			 * @param {string} type Event name
			 * @param {function} fn Callback function
			 * @param {boolean} passive Passive mode
			 *
			 * @memberof BOOMR.utils
			 */
			addListener: function(el, type, fn, passive) {
				var opts = false;


				if (el.addEventListener) {
					if (passive && BOOMR.browser.supportsPassive()) {
						opts = {
							capture: false,
							passive: true
						};
					}

					el.addEventListener(type, fn, opts);
				}
				else if (el.attachEvent) {
					el.attachEvent("on" + type, fn);
				}

				// ensure the type arry exists
				impl.listenerCallbacks[type] = impl.listenerCallbacks[type] || [];

				// save a reference to the target object and function
				impl.listenerCallbacks[type].push({ el: el, fn: fn});
			},

			/**
			 * Removes an event listener.
			 *
			 * @param {DOMElement} el DOM element
			 * @param {string} type Event name
			 * @param {function} fn Callback function
			 *
			 * @memberof BOOMR.utils
			 */
			removeListener: function(el, type, fn) {
				var i;


				if (el.removeEventListener) {
					// NOTE: We don't need to match any other options (e.g. passive)
					// from addEventListener, as removeEventListener only cares
					// about captive.
					el.removeEventListener(type, fn, false);
				}
				else if (el.detachEvent) {
					el.detachEvent("on" + type, fn);
				}

				if (impl.listenerCallbacks.hasOwnProperty(type)) {
					for (var i = 0; i < impl.listenerCallbacks[type].length; i++) {
						if (fn === impl.listenerCallbacks[type][i].fn &&
						    el === impl.listenerCallbacks[type][i].el) {
							impl.listenerCallbacks[type].splice(i, 1);
							return;
						}
					}
				}
			},

			/**
			 * Determines if the specified object is an `Array` or not
			 *
			 * @param {object} ary Object in question
			 *
			 * @returns {boolean} True if the object is an `Array`
			 *
			 * @memberof BOOMR.utils
			 */
			isArray: function(ary) {
				return Object.prototype.toString.call(ary) === "[object Array]";
			},

			/**
			 * Determines if the specified value is in the array
			 *
			 * @param {object} val Value to check
			 * @param {object} ary Object in question
			 *
			 * @returns {boolean} True if the value is in the Array
			 *
			 * @memberof BOOMR.utils
			 */
			inArray: function(val, ary) {
				var i;

				if (typeof val === "undefined" || typeof ary === "undefined" || !ary.length) {
					return false;
				}

				for (i = 0; i < ary.length; i++) {
					if (ary[i] === val) {
						return true;
					}
				}

				return false;
			},

			/**
			 * Get a query parameter value from a URL's query string
			 *
			 * @param {string} param Query parameter name
			 * @param {string|Object} [url] URL containing the query string, or a link object.
			 * Defaults to `BOOMR.window.location`
			 *
			 * @returns {string|null} URI decoded value or null if param isn't a query parameter
			 *
			 * @memberof BOOMR.utils
			 */
			getQueryParamValue: function(param, url) {
				var l, params, i, kv;
				if (!param) {
					return null;
				}

				if (typeof url === "string") {
					l = BOOMR.window.document.createElement("a");
					l.href = url;
				}
				else if (typeof url === "object" && typeof url.search === "string") {
					l = url;
				}
				else {
					l = BOOMR.window.location;
				}

				// Now that we match, pull out all query string parameters
				params = l.search.slice(1).split(/&/);

				for (i = 0; i < params.length; i++) {
					if (params[i]) {
						kv = params[i].split("=");
						if (kv.length && kv[0] === param) {
							return kv.length > 1 ? decodeURIComponent(kv.splice(1).join("=").replace(/\+/g, " ")) : "";
						}
					}
				}
				return null;
			},

			/**
			 * Generates a pseudo-random UUID (Version 4):
			 * https://en.wikipedia.org/wiki/Universally_unique_identifier
			 *
			 * @returns {string} UUID
			 *
			 * @memberof BOOMR.utils
			 */
			generateUUID: function() {
				return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function(c) {
					var r = Math.random() * 16 | 0;
					var v = c === "x" ? r : (r & 0x3 | 0x8);
					return v.toString(16);
				});
			},

			/**
			 * Generates a random ID based on the specified number of characters.  Uses
			 * characters a-z0-9.
			 *
			 * @param {number} chars Number of characters (max 40)
			 *
			 * @returns {string} Random ID
			 *
			 * @memberof BOOMR.utils
			 */
			generateId: function(chars) {
				return "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx".substr(0, chars || 40).replace(/x/g, function(c) {
					var c = (Math.random() || 0.01).toString(36);

					// some implementations may return "0" for small numbers
					if (c === "0") {
						return "0";
					}
					else {
						return c.substr(2, 1);
					}
				});
			},

			/**
			 * Attempt to serialize an object, preferring JSURL over JSON.stringify
			 *
			 * @param {Object} value Object to serialize
			 * @returns {string} serialized version of value, empty-string if not possible
			 */
			serializeForUrl: function(value) {
				if (BOOMR.utils.Compression && BOOMR.utils.Compression.jsUrl) {
					return BOOMR.utils.Compression.jsUrl(value);
				}
				if (window.JSON) {
					return JSON.stringify(value);
				}
				// not supported

				return "";
			},

			/**
			 * Attempt to identify the URL of boomerang itself using multiple methods for cross-browser support
			 *
			 * This method uses document.currentScript (which cannot be called from an event handler), script.readyState (IE6-10),
			 * and the stack property of a caught Error object.
			 *
			 * @returns {string} The URL of the currently executing boomerang script.
			 */
			getMyURL: function() {
				var stack;
				// document.currentScript works in all browsers except for IE: https://caniuse.com/#feat=document-currentscript
				// #boomr-if-as works in all browsers if the page uses our standard iframe loader
				// #boomr-scr-as works in all browsers if the page uses our preloader loader
				// BOOMR_script will be undefined on IE for pages that do not use our standard loaders

				// Note that we do not use `w.document` or `d` here because we need the current execution context
				var BOOMR_script = (document.currentScript || document.getElementById("boomr-if-as") || document.getElementById("boomr-scr-as"));

				if (BOOMR_script) {
					return BOOMR_script.src;
				}

				// For IE 6-10 users on pages not using the standard loader, we iterate through all scripts backwards
				var scripts = document.getElementsByTagName("script"), i;

				// i-- is both a decrement as well as a condition, ie, the loop will terminate when i goes from 0 to -1
				for (i = scripts.length; i--;) {
					// We stop at the first script that has its readyState set to interactive indicating that it is currently executing
					if (scripts[i].readyState === "interactive") {
						return scripts[i].src;
					}
				}

				// For IE 11, we throw an Error and inspect its stack property in the catch block
				// This also works on IE10, but throwing is disruptive so we try to avoid it and use
				// the less disruptive script iterator above
				try {
					throw new Error();
				}
				catch (e) {
					if ("stack" in e) {
						stack = this.arrayFilter(e.stack.split(/\n/), function(l) { return l.match(/https?:\/\//); });
						if (stack && stack.length) {
							return stack[0].replace(/.*(https?:\/\/.+?)(:\d+)+\D*$/m, "$1");
						}
					}
					// FWIW, on IE 8 & 9, the Error object does not contain a stack property, but if you have an uncaught error,
					// and a `window.onerror` handler (not using addEventListener), then the second argument to that handler is
					// the URL of the script that threw. The handler needs to `return true;` to prevent the default error handler
					// This flow is asynchronous though (due to the event handler), so won't work in a function return scenario
					// like this (we can't use promises because we would only need this hack in browsers that don't support promises).
				}

				return "";
			},

			/*
			 * Gets the Scroll x and y (rounded) for a page
			 *
			 * @returns {object} Scroll x and y coordinates
			 */
			scroll: function() {
				// Adapted from:
				// https://developer.mozilla.org/en-US/docs/Web/API/Window/scrollY
				var supportPageOffset = w.pageXOffset !== undefined;
				var isCSS1Compat = ((w.document.compatMode || "") === "CSS1Compat");

				var ret = {
					x: 0,
					y: 0
				};

				if (supportPageOffset) {
					if (typeof w.pageXOffset === "function") {
						ret.x = w.pageXOffset();
						ret.y = w.pageYOffset();
					}
					else {
						ret.x = w.pageXOffset;
						ret.y = w.pageYOffset;
					}
				}
				else if (isCSS1Compat) {
					ret.x = w.document.documentElement.scrollLeft;
					ret.y = w.document.documentElement.scrollTop;
				}
				else {
					ret.x = w.document.body.scrollLeft;
					ret.y = w.document.body.scrollTop;
				}

				// round to full numbers
				if (typeof ret.sx === "number") {
					ret.sx = Math.round(ret.sx);
				}

				if (typeof ret.sy === "number") {
					ret.sy = Math.round(ret.sy);
				}

				return ret;
			},

			/**
			 * Gets the window height
			 *
			 * @returns {number} Window height
			 */
			windowHeight: function() {
				return w.innerHeight || w.document.documentElement.clientHeight || w.document.body.clientHeight;
			},

			/**
			 * Gets the window width
			 *
			 * @returns {number} Window width
			 */
			windowWidth: function() {
				return w.innerWidth || w.document.documentElement.clientWidth || w.document.body.clientWidth;
			},

			/**
			 * Determines if the function is native or not
			 *
			 * @param {function} fn Function
			 *
			 * @returns {boolean} True when the function is native
			 */
			isNative: function(fn) {
				return !!fn &&
				    fn.toString &&
				    !fn.hasOwnProperty("toString") &&
				    /\[native code\]/.test(String(fn));
			},

			/**
			 * Overwrites a function on the specified object.
			 *
			 * When the Boomerang IFRAME unloads, it will swap the old
			 * function back in, so calls to the functions are successful.
			 *
			 * If this isn't done, callers of the overwritten functions may still
			 * call into freed Boomerang code or the IFRAME that is partially unloaded,
			 * leading to "Freed script" errors or exceptions from accessing
			 * unloaded DOM properties.
			 *
			 * This tracking isn't needed if Boomerang is loaded in the root
			 * document, as everthing will be cleaned up along with Boomerang
			 * on unload.
			 *
			 * @param {object} obj Object whose property will be overwritten
			 * @param {string} functionName Function name
			 * @param {function} newFn New function
			 */
			overwriteNative: function(obj, functionName, newFn) {
				// bail if the object doesn't exist
				if (!obj || !newFn) {
					return;
				}

				// we only need to keep track if we're running Boomerang in
				// an IFRAME
				if (BOOMR.boomerang_frame !== BOOMR.window) {
					// note we overwrote this
					impl.nativeOverwrites.push({
						obj: obj,
						functionName: functionName,
						origFn: obj[functionName]
					});
				}

				obj[functionName] = newFn;
			},

			/**
			 * Determines if the given input is an Integer.
			 * Relies on standard Number.isInteger() function that available
			 * is most browsers except IE. For IE, this relies on the polyfill
			 * provided by MDN: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isInteger#Polyfill
			 *
			 * @param {number} input dat
			 *
			 * @returns {string} Random ID
			 *
			 * @memberof BOOMR.utils
			 *
			 */
			isInteger: function(data) {
				var isInt = Number.isInteger || function(value) {
					return typeof value === "number" &&
						isFinite(value) &&
						Math.floor(value) === value;
				};

				return isInt(data);
			}


		}, // closes `utils`

		/**
		 * Browser feature detection flags.
		 *
		 * @class BOOMR.browser
		 */
		browser: {
			results: {},

			/**
			 * Whether or not the browser supports 'passive' mode for event
			 * listeners
			 *
			 * @returns {boolean} True if the browser supports passive mode
			 */
			supportsPassive: function() {
				if (typeof BOOMR.browser.results.supportsPassive === "undefined") {
					BOOMR.browser.results.supportsPassive = false;

					if (!Object.defineProperty) {
						return false;
					}

					try {
						var opts = Object.defineProperty({}, "passive", {
							get: function() {
								BOOMR.browser.results.supportsPassive = true;
							}
						});
						window.addEventListener("test", null, opts);
					}
					catch (e) {
						// NOP
					}
				}

				return BOOMR.browser.results.supportsPassive;
			}
		},

		/**
		 * Initializes Boomerang by applying the specified configuration.
		 *
		 * All plugins' `init()` functions will be called with the same config as well.
		 *
		 * @param {object} config Configuration object
		 * @param {boolean} [config.autorun] By default, boomerang runs automatically
		 * and attaches its `page_ready` handler to the `window.onload` event.
		 * If you set `autorun` to `false`, this will not happen and you will
		 * need to call {@link BOOMR.page_ready} yourself.
		 * @param {string} config.beacon_auth_key Beacon authorization key value
		 * @param {string} config.beacon_auth_token Beacon authorization token.
		 * @param {boolean} config.beacon_with_credentials Sends beacon with credentials
		 * @param {boolean} config.beacon_disable_sendbeacon Disables `navigator.sendBeacon()` support
		 * @param {string} config.beacon_url The URL to beacon results back to.
		 * If not set, no beacon will be sent.
		 * @param {boolean} config.beacon_url_force_https Forces protocol-relative Beacon URLs to HTTPS
		 * @param {string} config.beacon_type `GET`, `POST` or `AUTO`
		 * @param {string} [config.site_domain] The domain that all cookies should be set on
		 * Boomerang will try to auto-detect this, but unless your site is of the
		 * `foo.com` format, it will probably get it wrong. It's a good idea
		 * to set this to whatever part of your domain you'd like to share
		 * bandwidth and performance measurements across.
		 * Set this to a falsy value to disable all cookies.
		 * @param {boolean} [config.strip_query_string] Whether or not to strip query strings from all URLs (e.g. `u`, `pgu`, etc.)
		 * @param {string} [config.user_ip] Despite its name, this is really a free-form
		 * string used to uniquely identify the user's current internet
		 * connection. It's used primarily by the bandwidth test to determine
		 * whether it should re-measure the user's bandwidth or just use the
		 * value stored in the cookie. You may use IPv4, IPv6 or anything else
		 * that you think can be used to identify the user's network connection.
		 * @param {function} [config.log] Logger to use. Set to `null` to disable logging.
		 * @param {function} [<plugins>] Each plugin has its own section
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @memberof BOOMR
		 */
		init: function(config) {
			var i, k,
			    properties = [
				    "autorun",
				    "beacon_auth_key",
				    "beacon_auth_token",
				    "beacon_with_credentials",
				    "beacon_disable_sendbeacon",
				    "beacon_url",
				    "beacon_url_force_https",
				    "beacon_type",
				    "site_domain",
				    "strip_query_string",
				    "user_ip"
			    ];


			BOOMR_check_doc_domain();

			if (!config) {
				config = {};
			}

			BOOMR.tunaServiceKey = config.tunaServiceKey;

			// ensure logging is setup properly (or null'd out for production)
			if (config.log !== undefined) {
				this.log = config.log;
			}

			if (!this.log) {
				this.log = function(/* m,l,s */) {};
			}

			if (!this.pageId) {
				// generate a random page ID for this page's lifetime
				this.pageId = BOOMR.utils.generateId(8);

			}

			if (config.primary && impl.handlers_attached) {
				return this;
			}

			if (typeof config.site_domain === "string") {
				this.session.domain = config.site_domain;
			}

			// Set autorun if in config right now, as plugins that listen for page_ready
			// event may fire when they .init() if onload has already fired, and whether
			// or not we should fire page_ready depends on config.autorun.
			if (typeof config.autorun !== "undefined") {
				impl.autorun = config.autorun;
			}


			for (k in this.plugins) {
				if (this.plugins.hasOwnProperty(k)) {
					// config[plugin].enabled has been set to false
					if (config[k] &&
					    config[k].hasOwnProperty("enabled") &&
					    config[k].enabled === false) {
						impl.disabled_plugins[k] = 1;

						if (typeof this.plugins[k].disable === "function") {
							this.plugins[k].disable();
						}

						continue;
					}

					// plugin was previously disabled
					if (impl.disabled_plugins[k]) {

						// and has not been explicitly re-enabled
						if (!config[k] ||
						    !config[k].hasOwnProperty("enabled") ||
						    config[k].enabled !== true) {
							continue;
						}

						if (typeof this.plugins[k].enable === "function") {
							this.plugins[k].enable();
						}

						// plugin is now enabled
						delete impl.disabled_plugins[k];
					}

					// plugin exists and has an init method
					if (typeof this.plugins[k].init === "function") {
						try {

							this.plugins[k].init(config);

						}
						catch (err) {
							BOOMR.addError(err, k + ".init");
						}
					}
				}
			}


			for (i = 0; i < properties.length; i++) {
				if (config[properties[i]] !== undefined) {
					impl[properties[i]] = config[properties[i]];
				}
			}

			// if it's the first call to init (handlers aren't attached) and we're not asked to wait OR
			// it's the second init call (handlers are attached) and we were previously waiting
			// then we set up the page ready autorun functionality
			if ((!impl.handlers_attached && !config.wait) || (impl.handlers_attached && impl.waiting_for_config)) {
				// The developer can override onload by setting autorun to false
				if (!impl.onloadfired && (impl.autorun === undefined || impl.autorun !== false)) {
					if (BOOMR.hasBrowserOnloadFired()) {
						BOOMR.loadedLate = true;
					}
					BOOMR.attach_page_ready(BOOMR.page_ready_autorun);
				}
				impl.waiting_for_config = false;
			}

			// only attach handlers once
			if (impl.handlers_attached) {
				return this;
			}

			if (config.wait) {
				impl.waiting_for_config = true;
			}

			BOOMR.attach_page_ready(function() {
				// if we're not using the loader snippet, save the onload time for
				// browsers that do not support NavigationTiming.
				// This will be later than onload if boomerang arrives late on the
				// page but it's the best we can do
				if (!BOOMR.t_onload) {
					BOOMR.t_onload = BOOMR.now();
				}
			});

			BOOMR.utils.addListener(w, "DOMContentLoaded", function() { impl.fireEvent("dom_loaded"); });

			BOOMR.fireEvent("config", config);
			BOOMR.subscribe("config", function(beaconConfig) {
				if (beaconConfig.beacon_url) {
					impl.beacon_url = beaconConfig.beacon_url;
				}
			});

			BOOMR.subscribe("spa_navigation", impl.spaNavigation, null, impl);

			(function() {
				var forms, iterator;
				if (visibilityChange !== undefined) {
					BOOMR.utils.addListener(d, visibilityChange, function() { impl.fireEvent("visibility_changed"); });

					// save the current visibility state
					impl.lastVisibilityState = BOOMR.visibilityState();

					BOOMR.subscribe("visibility_changed", function() {
						var visState = BOOMR.visibilityState();

						// record the last time each visibility state occurred
						BOOMR.lastVisibilityEvent[visState] = BOOMR.now();


						// if we transitioned from prerender to hidden or visible, fire the prerender_to_visible event
						if (impl.lastVisibilityState === "prerender" &&
						    visState !== "prerender") {
							// note that we transitioned from prerender on the beacon for debugging
							BOOMR.addVar("vis.pre", "1");

							// let all listeners know
							impl.fireEvent("prerender_to_visible");
						}

						impl.lastVisibilityState = visState;
					});
				}

				BOOMR.utils.addListener(d, "mouseup", impl.xb_handler("click"));

				forms = d.getElementsByTagName("form");
				for (iterator = 0; iterator < forms.length; iterator++) {
					BOOMR.utils.addListener(forms[iterator], "submit", impl.xb_handler("form_submit"));
				}

				if (!w.onpagehide && w.onpagehide !== null) {
					// This must be the last one to fire
					// We only clear w on browsers that don't support onpagehide because
					// those that do are new enough to not have memory leak problems of
					// some older browsers
					BOOMR.utils.addListener(w, "unload", function() {
						BOOMR.window = w = null;
					});
				}

				// if we were loaded in an IFRAME, try to keep track if the IFRAME was unloaded
				if (BOOMR.boomerang_frame !== BOOMR.window) {
					BOOMR.utils.addListener(BOOMR.boomerang_frame, "unload", impl.onFrameUnloaded);
				}
			}());

			impl.handlers_attached = true;
			return this;
		},

		/**
		 * Attach a callback to the `pageshow` or `onload` event if `onload` has not
		 * been fired otherwise queue it to run immediately
		 *
		 * @param {function} cb Callback to run when `onload` fires or page is visible (`pageshow`)
		 *
		 * @memberof BOOMR
		 */
		attach_page_ready: function(cb) {
			if (BOOMR.hasBrowserOnloadFired()) {
				this.setImmediate(cb, null, null, BOOMR);
			}
			else {
				// Use `pageshow` if available since it will fire even if page came from a back-forward page cache.
				// Browsers that support `pageshow` will not fire `onload` if navigation was through a back/forward button
				// and the page was retrieved from back-forward cache.
				if (w.onpagehide || w.onpagehide === null) {
					BOOMR.utils.addListener(w, "pageshow", cb);
				}
				else {
					BOOMR.utils.addListener(w, "load", cb);
				}
			}
		},

		/**
		 * Sends the `page_ready` event only if `autorun` is still true after
		 * {@link BOOMR.init} is called.
		 *
		 * @param {Event} ev Event
		 *
		 * @memberof BOOMR
		 */
		page_ready_autorun: function(ev) {
			if (impl.autorun) {
				BOOMR.page_ready(ev, true);
			}
		},

		/**
		 * Method that fires the {@link BOOMR#event:page_ready} event. Call this
		 * only if you've set `autorun` to `false` when calling the {@link BOOMR.init}
		 * method. You should call this method when you determine that your page
		 * is ready to be used by your user. This will be the end-time used in
		 * the page load time measurement. Optionally, you can pass a Unix Epoch
		 * timestamp as a parameter or set the global `BOOMR_page_ready` var that will
		 * be used as the end-time instead.
		 *
		 * @param {Event|number} [ev] Ready event or optional load event end timestamp if called manually
		 * @param {boolean} auto True if called by `page_ready_autorun`
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @example
		 * BOOMR.init({ autorun: false, ... });
		 * // wait until the page is ready, i.e. your view has loaded
		 * BOOMR.page_ready();
		 *
		 * @memberof BOOMR
		 */
		page_ready: function(ev, auto) {
			var tm_page_ready;

			// a number can be passed as the first argument if called manually which
			// will be used as the loadEventEnd time
			if (!auto && typeof ev === "number") {
				tm_page_ready = ev;
				ev = null;
			}

			if (!ev) {
				ev = w.event;
			}

			if (!ev) {
				ev = {
					name: "load"
				};
			}

			// if we were called manually or global BOOMR_page_ready was set then
			// add loadEventEnd and note this was 'pr' on the beacon
			if (!auto) {
				ev.timing = ev.timing || {};
				// use timestamp parameter or global BOOMR_page_ready if set, otherwise use
				// the current timestamp
				if (tm_page_ready) {
					ev.timing.loadEventEnd = tm_page_ready;
				}
				else if (typeof w.BOOMR_page_ready === "number") {
					ev.timing.loadEventEnd = w.BOOMR_page_ready;
				}
				else {
					ev.timing.loadEventEnd = BOOMR.now();
				}

				BOOMR.addVar("pr", 1, true);
			}
			else if (typeof w.BOOMR_page_ready === "number") {
				ev.timing = ev.timing || {};
				// the global BOOMR_page_ready will override our loadEventEnd
				ev.timing.loadEventEnd = w.BOOMR_page_ready;

				BOOMR.addVar("pr", 1, true);
			}

			if (impl.onloadfired) {
				return this;
			}

			impl.fireEvent("page_ready", ev);
			impl.onloadfired = true;
			return this;
		},

		/**
		 * Determines whether or not the page's `onload` event has fired
		 *
		 * @returns {boolean} True if page's onload was called
		 */
		hasBrowserOnloadFired: function() {
			var p = BOOMR.getPerformance();
			// if the document is `complete` then the `onload` event has already occurred, we'll fire the callback immediately.
			// When `document.write` is used to replace the contents of the page and inject boomerang, the document `readyState`
			// will go from `complete` back to `loading` and then to `complete` again. The second transition to `complete`
			// doesn't fire a second `pageshow` event in some browsers (e.g. Safari). We need to check if
			// `performance.timing.loadEventStart` or `BOOMR_onload` has occurred to detect this scenario. Will not work for
			// older Safari that doesn't have NavTiming
			return ((d.readyState && d.readyState === "complete") ||
			    (p && p.timing && p.timing.loadEventStart > 0) ||
			    w.BOOMR_onload > 0);
		},

		/**
		 * Determines whether or not the page's `onload` event has fired, or
		 * if `autorun` is false, whether {@link BOOMR.page_ready} was called.
		 *
		 * @returns {boolean} True if `onload` or {@link BOOMR.page_ready} were called
		 *
		 * @memberof BOOMR
		 */
		onloadFired: function() {
			return impl.onloadfired;
		},

		/**
		 * The callback function may return a falsy value to disconnect the observer
		 * after it returns, or a truthy value to keep watching for mutations. If
		 * the return value is numeric and greater than 0, then this will be the new timeout.
		 * If it is boolean instead, then the timeout will not fire any more so
		 * the caller MUST call disconnect() at some point
		 *
		 * @callback BOOMR~setImmediateCallback
		 * @param {object} data The passed in `data` object
		 * @param {object} cb_data The passed in `cb_data` object
		 * @param {Error} callstack An Error object that holds the callstack for
		 * when `setImmediate` was called, used to determine what called the callback
		 */

		/**
		 * Defer the function `fn` until the next instant the browser is free from
		 * user tasks.
		 *
		 * @param {BOOMR~setImmediateCallback} fn The callback function.
		 * @param {object} [data] Any data to pass to the callback function
		 * @param {object} [cb_data] Any passthrough data for the callback function.
		 * This differs from `data` when `setImmediate` is called via an event
		 * handler and `data` is the Event object
		 * @param {object} [cb_scope] The scope of the callback function if it is a method of an object
		 *
		 * @returns nothing
		 *
		 * @memberof BOOMR
		 */
		setImmediate: function(fn, data, cb_data, cb_scope) {
			var cb, cstack;


			cb = function() {
				fn.call(cb_scope || null, data, cb_data || {}, cstack);
				cb = null;
			};

			if (w.requestIdleCallback) {
				// set a timeout since rIC doesn't get called reliably in chrome headless
				w.requestIdleCallback(cb, {timeout: 1000});
			}
			else if (w.setImmediate) {
				w.setImmediate(cb);
			}
			else {
				setTimeout(cb, 10);
			}
		},

		/**
		 * Gets the current time in milliseconds since the Unix Epoch (Jan 1 1970).
		 *
		 * In browsers that support `DOMHighResTimeStamp`, this will be replaced
		 * by a function that adds `performance.now()` to `navigationStart`
		 * (with milliseconds.microseconds resolution).
		 *
		 * @function
		 *
		 * @returns {TimeStamp} Milliseconds since Unix Epoch
		 *
		 * @memberof BOOMR
		 */
		now: (function() {
			return Date.now || function() { return new Date().getTime(); };
		}()),

		/**
		 * Gets the `window.performance` object of the root window.
		 *
		 * Checks vendor prefixes for older browsers (e.g. IE9).
		 *
		 * @returns {Performance|undefined} `window.performance` if it exists
		 *
		 * @memberof BOOMR
		 */
		getPerformance: function() {
			try {
				if (BOOMR.window) {
					if ("performance" in BOOMR.window && BOOMR.window.performance) {
						return BOOMR.window.performance;
					}

					// vendor-prefixed fallbacks
					return BOOMR.window.msPerformance ||
					    BOOMR.window.webkitPerformance ||
					    BOOMR.window.mozPerformance;
				}
			}
			catch (ignore) {
				// empty
			}
		},

		/**
		 * Get high resolution delta timestamp from time origin
		 *
		 * This function needs to approximate the time since the performance timeOrigin
		 * or Navigation Timing API's `navigationStart` time.
		 * If available, `performance.now()` can provide this value.
		 * If not we either get the navigation start time from the RT plugin or
		 * from `t_lstart` or `t_start`. Those values are subtracted from the current
		 * time to derive a time since `navigationStart` value.
		 *
		 * @returns {float} Exact or approximate time since the time origin.
		 */
		hrNow: function() {
			var now, navigationStart, p = BOOMR.getPerformance();

			if (p && p.now) {
				now = p.now();
			}
			else {
				navigationStart = (BOOMR.plugins.RT && BOOMR.plugins.RT.navigationStart &&
					BOOMR.plugins.RT.navigationStart()) || BOOMR.t_lstart || BOOMR.t_start;

				// if navigationStart is undefined, we'll be returning NaN
				now = BOOMR.now() - navigationStart;
			}

			return now;
		},

		/**
		 * Gets the `document.visibilityState`, or `visible` if Page Visibility
		 * is not supported.
		 *
		 * @function
		 *
		 * @returns {string} Visibility state
		 *
		 * @memberof BOOMR
		 */
		visibilityState: (visibilityState === undefined ? function() {
			return "visible";
		} : function() {
			return d[visibilityState];
		}),

		/**
		 * An mapping of visibliity event states to the latest time they happened
		 *
		 * @type {object}
		 *
		 * @memberof BOOMR
		 */
		lastVisibilityEvent: {},

		/**
		 * Registers a Boomerang event.
		 *
		 * @param {string} e_name Event name
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @memberof BOOMR
		 */
		registerEvent: function(e_name) {
			if (impl.events.hasOwnProperty(e_name)) {
				// already registered
				return this;
			}

			// create a new queue of handlers
			impl.events[e_name] = [];

			return this;
		},

		/**
		 * Disables boomerang from doing anything further:
		 * 1. Clears event handlers (such as onload)
		 * 2. Clears all event listeners
		 *
		 * @memberof BOOMR
		 */
		disable: function() {
			impl.clearEvents();
			impl.clearListeners();
		},

		/**
		 * Fires a Boomerang event
		 *
		 * @param {string} e_name Event name
		 * @param {object} data Event payload
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @memberof BOOMR
		 */
		fireEvent: function(e_name, data) {
			return impl.fireEvent(e_name, data);
		},

		/**
		 * @callback BOOMR~subscribeCallback
		 * @param {object} eventData Event data
		 * @param {object} cb_data Callback data
		 */

		/**
		 * Subscribes to a Boomerang event
		 *
		 * @param {string} e_name Event name, i.e. {@link BOOMR#event:page_ready}.
		 * @param {BOOMR~subscribeCallback} fn Callback function
		 * @param {object} cb_data Callback data, passed as the second parameter to the callback function
		 * @param {object} cb_scope Callback scope.  If set to an object, then the
		 * callback function is called as a method of this object, and all
		 * references to `this` within the callback function will refer to `cb_scope`.
		 * @param {boolean} once Whether or not this callback should only be run once
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @memberof BOOMR
		 */
		subscribe: function(e_name, fn, cb_data, cb_scope, once) {
			var i, handler, ev;

			e_name = e_name.toLowerCase();


			// translate old names
			if (impl.translate_events[e_name]) {
				e_name = impl.translate_events[e_name];
			}

			if (!impl.events.hasOwnProperty(e_name)) {
				// allow subscriptions before they're registered
				impl.events[e_name] = [];
			}

			ev = impl.events[e_name];

			// don't allow a handler to be attached more than once to the same event
			for (i = 0; i < ev.length; i++) {
				handler = ev[i];
				if (handler && handler.fn === fn && handler.cb_data === cb_data && handler.scope === cb_scope) {
					return this;
				}
			}

			ev.push({
				fn: fn,
				cb_data: cb_data || {},
				scope: cb_scope || null,
				once: once || false
			});

			// attaching to page_ready after onload fires, so call soon
			if (e_name === "page_ready" && impl.onloadfired && impl.autorun) {
				this.setImmediate(fn, null, cb_data, cb_scope);
			}

			// Attach unload handlers directly to the window.onunload and
			// window.onbeforeunload events. The first of the two to fire will clear
			// fn so that the second doesn't fire. We do this because technically
			// onbeforeunload is the right event to fire, but not all browsers
			// support it.  This allows us to fall back to onunload when onbeforeunload
			// isn't implemented
			if (e_name === "page_unload" || e_name === "before_unload") {
				// Keep track of how many pagehide/unload/beforeunload handlers we're registering
				impl.unloadEventsCount++;

				(function() {
					var unload_handler, evt_idx = ev.length;

					unload_handler = function(evt) {
						if (fn) {
							fn.call(cb_scope, evt || w.event, cb_data);
						}

						// If this was the last pagehide/unload/beforeunload handler,
						// we'll try to send the beacon immediately after it is done.
						// The beacon will only be sent if one of the handlers has queued it.
						if (++impl.unloadEventCalled === impl.unloadEventsCount) {
							BOOMR.real_sendBeacon();
						}
					};

					if (e_name === "page_unload") {
						// pagehide is for iOS devices
						// see http://www.webkit.org/blog/516/webkit-page-cache-ii-the-unload-event/
						if (w.onpagehide || w.onpagehide === null) {
							BOOMR.utils.addListener(w, "pagehide", unload_handler);
						}
						else {
							BOOMR.utils.addListener(w, "unload", unload_handler);
						}
					}
					BOOMR.utils.addListener(w, "beforeunload", unload_handler);
				}());
			}

			return this;
		},

		/**
		 * Logs an internal Boomerang error.
		 *
		 * If the {@link BOOMR.plugins.Errors} plugin is enabled, this data will
		 * be compressed on the `err` beacon parameter.  If not, it will be included
		 * in uncompressed form on the `errors` parameter.
		 *
		 * @param {string|object} err Error
		 * @param {string} [src] Source
		 * @param {object} [extra] Extra data
		 *
		 * @memberof BOOMR
		 */
		addError: function BOOMR_addError(err, src, extra) {
			var str, E = BOOMR.plugins.Errors;


			BOOMR.error("Boomerang caught error: " + err + ", src: " + src + ", extra: " + extra);

			//
			// Use the Errors plugin if it's enabled
			//
			if (E && E.is_supported()) {
				if (typeof err === "string") {
					E.send({
						message: err,
						extra: extra,
						functionName: src,
						noStack: true
					}, E.VIA_APP, E.SOURCE_BOOMERANG);
				}
				else {
					if (typeof src === "string") {
						err.functionName = src;
					}

					if (typeof extra !== "undefined") {
						err.extra = extra;
					}

					E.send(err, E.VIA_APP, E.SOURCE_BOOMERANG);
				}

				return;
			}

			if (typeof err !== "string") {
				str = String(err);
				if (str.match(/^\[object/)) {
					str = err.name + ": " + (err.description || err.message).replace(/\r\n$/, "");
				}
				err = str;
			}
			if (src !== undefined) {
				err = "[" + src + ":" + BOOMR.now() + "] " + err;
			}
			if (extra) {
				err += ":: " + extra;
			}

			if (impl.errors[err]) {
				impl.errors[err]++;
			}
			else {
				impl.errors[err] = 1;
			}
		},

		/**
		 * Determines if the specified Error is a Cross-Origin error.
		 *
		 * @param {string|object} err Error
		 *
		 * @returns {boolean} True if the Error is a Cross-Origin error.
		 *
		 * @memberof BOOMR
		 */
		isCrossOriginError: function(err) {
			// These are expected for cross-origin iframe access.
			// For IE and Edge, we'll also check the error number for non-English browsers
			return err.name === "SecurityError" ||
				(err.name === "TypeError" && err.message === "Permission denied") ||
				(err.name === "Error" && err.message && err.message.match(/^(Permission|Access is) denied/)) ||
				err.number === -2146828218;  // IE/Edge error number for "Permission Denied"
		},

		/**
		 * Add one or more parameters to the beacon.
		 *
		 * This method may either be called with a single object containing
		 * key/value pairs, or with two parameters, the first is the variable
		 * name and the second is its value.
		 *
		 * All names should be strings usable in a URL's query string.
		 *
		 * We recommend only using alphanumeric characters and underscores, but you
		 * can use anything you like.
		 *
		 * Values should be strings (or numbers), and have the same restrictions
		 * as names.
		 *
		 * Parameters will be on all subsequent beacons unless `singleBeacon` is
		 * set.
		 *
		 * @param {string} name Variable name
		 * @param {string|object} val Value
		 * @param {boolean} singleBeacon Whether or not to add to a single beacon
		 * or all beacons
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @example
		 * BOOMR.addVar("page_id", 123);
		 * BOOMR.addVar({"page_id": 123, "user_id": "Person1"});
		 *
		 * @memberof BOOMR
		 */
		 addVar: function(name, value, singleBeacon) {
			if (typeof name === "string") {
				impl.vars[name] = value;
			}
			else if (typeof name === "object") {
				var o = name, k;
				for (k in o) {
					if (o.hasOwnProperty(k)) {
						impl.vars[k] = o[k];
					}
				}
			}

			if (singleBeacon) {
				impl.singleBeaconVars[name] = 1;
			}

			return this;
		},

		/**
		 * Appends data to a beacon.
		 *
		 * If the value already exists, a comma is added and the new data is applied.
		 *
		 * @param {string} name Variable name
		 * @param {string} val Value
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @memberof BOOMR
		 */
		appendVar: function(name, value) {
			var existing = BOOMR.getVar(name) || "";
			if (existing) {
				existing += ",";
			}

			BOOMR.addVar(name, existing + value);

			return this;
		},

		/**
		 * Removes one or more variables from the beacon URL. This is useful within
		 * a plugin to reset the values of parameters that it is about to set.
		 *
		 * Plugins can also use this in the {@link BOOMR#event:beacon} event to clear
		 * any variables that should only live on a single beacon.
		 *
		 * This method accepts either a list of variable names, or a single
		 * array containing a list of variable names.
		 *
		 * @param {string[]|string} name Variable name or list
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @memberof BOOMR
		 */
		removeVar: function(arg0) {
			var i, params;
			if (!arguments.length) {
				return this;
			}

			if (arguments.length === 1 && BOOMR.utils.isArray(arg0)) {
				params = arg0;
			}
			else {
				params = arguments;
			}

			for (i = 0; i < params.length; i++) {
				if (impl.vars.hasOwnProperty(params[i])) {
					delete impl.vars[params[i]];
				}
			}

			return this;
		},

		/**
		 * Determines whether or not the beacon has the specified variable.
		 *
		 * @param {string} name Variable name
		 *
		 * @returns {boolean} True if the variable is set.
		 *
		 * @memberof BOOMR
		 */
		hasVar: function(name) {
			return impl.vars.hasOwnProperty(name);
		},

		/**
		 * Gets the specified variable.
		 *
		 * @param {string} name Variable name
		 *
		 * @returns {object|undefined} Variable, or undefined if it isn't set
		 *
		 * @memberof BOOMR
		 */
		getVar: function(name) {
			return impl.vars[name];
		},

		/**
		 * Sets a variable's priority in the beacon URL.
		 * -1 = beginning of the URL
		 * 0  = middle of the URL (default)
		 * 1  = end of the URL
		 *
		 * @param {string} name Variable name
		 * @param {number} pri Priority (-1 or 1)
		 *
		 * @returns {BOOMR} Boomerang object
		 *
		 * @memberof BOOMR
		 */
		setVarPriority: function(name, pri) {
			if (typeof pri !== "number" || Math.abs(pri) !== 1) {
				return this;
			}

			impl.varPriority[pri][name] = 1;

			return this;
		},

		/**
		 * Sets the Referrers variable.
		 *
		 * @param {string} r Referrer from the document.referrer
		 *
		 * @memberof BOOMR
		 */
		setReferrer: function(r) {
			// document.referrer
			impl.r = r;
		},

		/**
		 * Starts a timer for a dynamic request.
		 *
		 * Once the named request has completed, call `loaded()` to send a beacon
		 * with the duration.
		 *
		 * @example
		 * var timer = BOOMR.requestStart("my-timer");
		 * // do stuff
		 * timer.loaded();
		 *
		 * @param {string} name Timer name
		 *
		 * @returns {object} An object with a `.loaded()` function that you can call
		 *     when the dynamic timer is complete.
		 *
		 * @memberof BOOMR
		 */
		requestStart: function(name) {
			var t_start = BOOMR.now();
			BOOMR.plugins.RT.startTimer("xhr_" + name, t_start);

			return {
				loaded: function(data) {
					BOOMR.responseEnd(name, t_start, data);
				}
			};
		},

		/**
		 * Determines if Boomerang can send a beacon.
		 *
		 * Queryies all plugins to see if they implement `readyToSend()`,
		 * and if so, that they return `true`.
		 *
		 * If not, the beacon cannot be sent.
		 *
		 * @returns {boolean} True if Boomerang can send a beacon
		 *
		 * @memberof BOOMR
		 */
		readyToSend: function() {
			var plugin;

			for (plugin in this.plugins) {
				if (this.plugins.hasOwnProperty(plugin)) {
					if (impl.disabled_plugins[plugin]) {
						continue;
					}

					if (typeof this.plugins[plugin].readyToSend === "function" &&
					    this.plugins[plugin].readyToSend() === false) {

						return false;
					}
				}
			}

			return true;
		},

		/**
		 * Sends a beacon for a dynamic request.
		 *
		 * @param {string|object} name Timer name or timer object data.
		 * @param {string} [name.initiator] Initiator, such as `xhr` or `spa`
		 * @param {string} [name.url] URL of the request
		 * @param {TimeStamp} t_start Start time
		 * @param {object} data Request data
		 * @param {TimeStamp} t_end End time
		 *
		 * @memberof BOOMR
		 */
		responseEnd: function(name, t_start, data, t_end) {
			// take the now timestamp for start and end, if unspecified, in case we delay this beacon
			t_start = typeof t_start === "number" ? t_start : BOOMR.now();
			t_end = typeof t_end === "number" ? t_end : BOOMR.now();

			// wait until all plugins are ready to send
			if (!BOOMR.readyToSend()) {


				// try again later
				setTimeout(function() {
					BOOMR.responseEnd(name, t_start, data, t_end);
				}, 1000);

				return;
			}

			// Wait until we've sent the Page Load beacon first
			if (!BOOMR.hasSentPageLoadBeacon() &&
			    !BOOMR.utils.inArray(name.initiator, BOOMR.constants.BEACON_TYPE_SPAS)) {
				// wait for a beacon, then try again
				BOOMR.subscribe("page_load_beacon", function() {
					BOOMR.responseEnd(name, t_start, data, t_end);
				}, null, BOOMR, true);

				return;
			}

			// Ensure we don't have two beacons trying to send data at the same time
			if (impl.beaconInQueue) {
				// wait until the beacon is sent, then try again
				BOOMR.subscribe("beacon", function() {
					BOOMR.responseEnd(name, t_start, data, t_end);
				}, null, BOOMR, true);

				return;
			}

			// Lock the beacon queue
			impl.beaconInQueue = true;

			if (typeof name === "object") {
				if (!name.url) {

					return;
				}

				impl.fireEvent("xhr_load", name);
			}
			else {
				// flush out any queue'd beacons before we set the Page Group
				// and timers
				BOOMR.real_sendBeacon();

				BOOMR.addVar("xhr.pg", name);
				BOOMR.plugins.RT.startTimer("xhr_" + name, t_start);
				impl.fireEvent("xhr_load", {
					name: "xhr_" + name,
					data: data,
					timing: {
						loadEventEnd: t_end
					}
				});
			}
		},

		//
		// uninstrumentXHR, instrumentXHR, uninstrumentFetch and instrumentFetch
		// are stubs that will be replaced by auto-xhr.js if active.
		//
		/**
		 * Undo XMLHttpRequest instrumentation and reset the original `XMLHttpRequest`
		 * object
		 *
		 * This is implemented in `plugins/auto-xhr.js` {@link BOOMR.plugins.AutoXHR}.
		 *
		 * @memberof BOOMR
		 */
		uninstrumentXHR: function() { },

		/**
		 * Instrument all requests made via XMLHttpRequest to send beacons.
		 *
		 * This is implemented in `plugins/auto-xhr.js` {@link BOOMR.plugins.AutoXHR}.
		 *
		 * @memberof BOOMR
		 */
		instrumentXHR: function() { },

		/**
		 * Undo fetch instrumentation and reset the original `fetch`
		 * function
		 *
		 * This is implemented in `plugins/auto-xhr.js` {@link BOOMR.plugins.AutoXHR}.
		 *
		 * @memberof BOOMR
		 */
		uninstrumentFetch: function() { },

		/**
		 * Instrument all requests made via fetch to send beacons.
		 *
		 * This is implemented in `plugins/auto-xhr.js` {@link BOOMR.plugins.AutoXHR}.
		 *
		 * @memberof BOOMR
		 */
		instrumentFetch: function() { },

		/**
		 * Request boomerang to send its beacon with all queued beacon data
		 * (via {@link BOOMR.addVar}).
		 *
		 * Boomerang may ignore this request.
		 *
		 * When this method is called, boomerang checks all plugins. If any
		 * plugin has not completed its checks (ie, the plugin's `is_complete()`
		 * method returns `false`, then this method does nothing.
		 *
		 * If all plugins have completed, then this method fires the
		 * {@link BOOMR#event:before_beacon} event with all variables that will be
		 * sent on the beacon.
		 *
		 * After all {@link BOOMR#event:before_beacon} handlers return, this method
		 * checks if a `beacon_url` has been configured and if there are any
		 * beacon parameters to be sent. If both are true, it fires the beacon.
		 *
		 * The {@link BOOMR#event:beacon} event is then fired.
		 *
		 * `sendBeacon()` should be called any time a plugin goes from
		 * `is_complete() = false` to `is_complete = true` so the beacon is
		 * sent.
		 *
		 * The actual beaconing is handled in {@link BOOMR.real_sendBeacon} after
		 * a short delay (via {@link BOOMR.setImmediate}).  If other calls to
		 * `sendBeacon` happen before {@link BOOMR.real_sendBeacon} is called,
		 * those calls will be discarded (so it's OK to call this in quick
		 * succession).
		 *
		 * @param {string} [beacon_url_override] Beacon URL override
		 *
		 * @memberof BOOMR
		 */
		sendBeacon: function(beacon_url_override) {
			// This plugin wants the beacon to go somewhere else,
			// so update the location
			if (beacon_url_override) {
				impl.beacon_url_override = beacon_url_override;
			}

			if (!impl.beaconQueued) {
				impl.beaconQueued = true;
				BOOMR.setImmediate(BOOMR.real_sendBeacon, null, null, BOOMR);
			}

			return true;
		},

		/**
		 * Sends a beacon when the beacon queue is empty.
		 *
		 * @param {object} params Beacon parameters to set
		 * @param {function} callback Callback to run when the queue is ready
		 * @param {object} that Function to apply callback to
		 */
		sendBeaconWhenReady: function(params, callback, that) {
			// If we're already sending a beacon, wait until the queue is empty
			if (impl.beaconInQueue) {
				// wait until the beacon is sent, then try again
				BOOMR.subscribe("beacon", function() {
					BOOMR.sendBeaconWhenReady(params, callback, that);
				}, null, BOOMR, true);

				return;
			}

			// Lock the beacon queue
			impl.beaconInQueue = true;

			// add all parameters
			for (var paramName in params) {
				if (params.hasOwnProperty(paramName)) {
					// add this data to a single beacon
					BOOMR.addVar(paramName, params[paramName], true);
				}
			}

			// run the callback
			if (typeof callback === "function" && typeof that !== "undefined") {
				callback.apply(that);
			}

			// send the beacon
			BOOMR.sendBeacon();
		},

		/**
		 * Sends all beacon data.
		 *
		 * This function should be called directly any time a "new" beacon is about
		 * to be constructed.  For example, if you're creating a new XHR or other
		 * custom beacon, you should ensure the existing beacon data is flushed
		 * by calling `BOOMR.real_sendBeacon();` first.
		 *
		 * @memberof BOOMR
		 */
		real_sendBeacon: function() {
			var k, form, url, errors = [], params = [], paramsJoined, varsSent = {}, _if;

			if (!impl.beaconQueued) {
				return false;
			}

			impl.beaconQueued = false;

			// At this point someone is ready to send the beacon.  We send
			// the beacon only if all plugins have finished doing what they
			// wanted to do
			for (k in this.plugins) {
				if (this.plugins.hasOwnProperty(k)) {
					if (impl.disabled_plugins[k]) {
						continue;
					}
					if (!this.plugins[k].is_complete(impl.vars)) {
						return false;
					}
				}
			}

			// Sanity test that the browser is still available (and not shutting down)
			if (!window || !window.Image || !window.navigator || !BOOMR.window) {

				return false;
			}

			// For SPA apps, don't strip hashtags as some SPA frameworks use #s for tracking routes
			// instead of History pushState() APIs. Use d.URL instead of location.href because of a
			// Safari bug.
			var isSPA = BOOMR.utils.inArray(impl.vars["http.initiator"], BOOMR.constants.BEACON_TYPE_SPAS);
			var isPageLoad = typeof impl.vars["http.initiator"] === "undefined" || isSPA;

			if (!impl.vars.pgu) {
				impl.vars.pgu = isSPA ? d.URL : d.URL.replace(/#.*/, "");
			}
			impl.vars.pgu = BOOMR.utils.cleanupURL(impl.vars.pgu);

			// Use the current document.URL if it hasn't already been set, or for SPA apps,
			// on each new beacon (since each SPA soft navigation might change the URL)
			if (!impl.vars.u || isSPA) {
				impl.vars.u = impl.vars.pgu;
			}

			if (impl.vars.pgu === impl.vars.u) {
				delete impl.vars.pgu;
			}

			// Add cleaned-up referrer URLs to the beacon, if available
			if (impl.r) {
				impl.vars.r = BOOMR.utils.cleanupURL(impl.r);
			}
			else {
				delete impl.vars.r;
			}

			impl.vars.v = BOOMR.version;

			// Snippet version, if available
			if (BOOMR.snippetVersion) {
				impl.vars.sv = BOOMR.snippetVersion;
			}

			// Snippet method is IFRAME if not specified (pre-v12 snippets)
			impl.vars.sm = BOOMR.snippetMethod || "i";

			if (BOOMR.session.enabled) {
				impl.vars["rt.si"] = BOOMR.session.ID + "-" + Math.round(BOOMR.session.start / 1000).toString(36);
				impl.vars["rt.ss"] = BOOMR.session.start;
				impl.vars["rt.sl"] = BOOMR.session.length;
			}

			if (BOOMR.visibilityState()) {
				impl.vars["vis.st"] = BOOMR.visibilityState();
				if (BOOMR.lastVisibilityEvent.visible) {
					impl.vars["vis.lv"] = BOOMR.now() - BOOMR.lastVisibilityEvent.visible;
				}
				if (BOOMR.lastVisibilityEvent.hidden) {
					impl.vars["vis.lh"] = BOOMR.now() - BOOMR.lastVisibilityEvent.hidden;
				}
			}

			impl.vars["ua.plt"] = navigator.platform;
			impl.vars["ua.vnd"] = navigator.vendor;

			if (this.pageId) {
				impl.vars.pid = this.pageId;
			}

			// add beacon number
			impl.vars.n = ++this.beaconsSent;

			if (w !== window) {
				_if = "if";  // work around uglifyJS minification that breaks in IE8 and quirks mode
				impl.vars[_if] = "";
			}

			for (k in impl.errors) {
				if (impl.errors.hasOwnProperty(k)) {
					errors.push(k + (impl.errors[k] > 1 ? " (*" + impl.errors[k] + ")" : ""));
				}
			}

			if (errors.length > 0) {
				impl.vars.errors = errors.join("\n");
			}

			impl.errors = {};

			// If we reach here, all plugins have completed
			impl.fireEvent("before_beacon", impl.vars);

			// clone the vars object for two reasons: first, so all listeners of
			// 'beacon' get an exact clone (in case listeners are doing
			// BOOMR.removeVar), and second, to help build our priority list of vars.
			for (k in impl.vars) {
				if (impl.vars.hasOwnProperty(k)) {
					varsSent[k] = impl.vars[k];
				}
			}

			BOOMR.removeVar(["qt", "pgu"]);

			// remove any vars that should only be on a single beacon
			for (var singleVarName in impl.singleBeaconVars) {
				if (impl.singleBeaconVars.hasOwnProperty(singleVarName)) {
					BOOMR.removeVar(singleVarName);
				}
			}

			// clear single beacon vars list
			impl.singleBeaconVars = {};

			// keep track of page load beacons
			if (!impl.hasSentPageLoadBeacon && isPageLoad) {
				impl.hasSentPageLoadBeacon = true;

				// let this beacon go out first
				BOOMR.setImmediate(function() {
					impl.fireEvent("page_load_beacon", varsSent);
				});
			}

			// Stop at this point if we are rate limited
			if (BOOMR.session.rate_limited) {

				return false;
			}

			// mark that we're no longer sending a beacon now, as those
			// paying attention to this will trigger at the beacon event
			impl.beaconInQueue = false;

			// send the beacon data
			// console.log( varsSent['http.initiator'] );
			// //   if(!('http.initiator' in varsSent) || varsSent['http.initiator'] == 'xhr'){
			// if(varsSent['http.initiator'] == 'xhr'){
			// 	console.log(varsSent);
			// 	// debugger;
			// 	// return false;
			// }

			if(!('http.initiator' in varsSent)) return false;
			BOOMR.sendBeaconData(BOOMR.plugins.convertTuna ? BOOMR.plugins.convertTuna.convert(varsSent) : varsSent);

			return true;
		},

		/**
		 * Determines whether or not a Page Load beacon has been sent.
		 *
		 * @returns {boolean} True if a Page Load beacon has been sent.
		 */
		hasSentPageLoadBeacon: function() {
			return impl.hasSentPageLoadBeacon;
		},

		/**
		 * Sends beacon data via the Beacon API, XHR or Image
		 *
		 * @param {object} data Data
		 */
		sendBeaconData: function(data) {

			// console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
			// console.log('~ 가공된 최종 data 를 받아오는 부분 ~');
			// console.log( JSON.stringify( data ) );

			var urlFirst = [], urlLast = [], params, paramsJoined,
			    url, img, useImg = true, xhr, ret;


			// Use the override URL if given
			impl.beacon_url = impl.beacon_url_override || impl.beacon_url;

			// Check that the beacon_url was set first
			if (!impl.beacon_url) {

				return false;
			}

			if (!impl.beaconUrlAllowed(impl.beacon_url)) {

				return false;
			}

			// Check that we have data to send
			if (data.length === 0) {
				return false;
			}

			// If we reach here, we've figured out all of the beacon data we'll send.
			impl.fireEvent("beacon", data);

			// get high- and low-priority variables first, which remove any of
			// those vars from data
			urlFirst = this.getVarsOfPriority(data, -1);
			urlLast  = this.getVarsOfPriority(data, 1);

			// merge the 3 lists
			params = urlFirst.concat(this.getVarsOfPriority(data, 0), urlLast);
			paramsJoined = params.join("&");

			// If beacon_url is protocol relative, make it https only
			if (impl.beacon_url_force_https && impl.beacon_url.match(/^\/\//)) {
				impl.beacon_url = "https:" + impl.beacon_url;
			}

			// if there are already url parameters in the beacon url,
			// change the first parameter prefix for the boomerang url parameters to &
			url = impl.beacon_url + ((impl.beacon_url.indexOf("?") > -1) ? "&" : "?") + paramsJoined;

			//
			// Try to send an IMG beacon if possible (which is the most compatible),
			// otherwise send an XHR beacon if the  URL length is longer than 2,000 bytes.
			//
			if (impl.beacon_type === "GET") {
				useImg = true;

				if (url.length > BOOMR.constants.MAX_GET_LENGTH) {
					((window.console && (console.warn || console.log)) || function() {})("Boomerang: Warning: Beacon may not be sent via GET due to payload size > 2000 bytes");
				}
			}
			else if (impl.beacon_type === "POST" || url.length > BOOMR.constants.MAX_GET_LENGTH) {
				// switch to a XHR beacon if the the user has specified a POST OR GET length is too long
				useImg = false;
			}

			//
			// Try the sendBeacon API first.
			// But if beacon_type is set to "GET", dont attempt
			// sendBeacon API call
			//
			if (w && w.navigator &&
			    typeof w.navigator.sendBeacon === "function" &&
			    BOOMR.utils.isNative(w.navigator.sendBeacon) &&
			    typeof w.Blob === "function" &&
			    impl.beacon_type !== "GET" &&
			    // As per W3C, The sendBeacon method does not provide ability to pass any
			    // header other than 'Content-Type'. So if we need to send data with
			    // 'Authorization' header, we need to fallback to good old xhr.
			    typeof impl.beacon_auth_token === "undefined" &&
			    !impl.beacon_disable_sendbeacon) {
				// note we're using sendBeacon with &sb=1
				var blobData = new w.Blob([paramsJoined + "&sb=1"], {
					type: "application/x-www-form-urlencoded"
				});

				if (w.navigator.sendBeacon(impl.beacon_url, blobData)) {
					return true;
				}

				// sendBeacon was not successful, try Image or XHR beacons
			}

			// If we don't have XHR available, force an image beacon and hope
			// for the best
			if (!BOOMR.orig_XMLHttpRequest && (!w || !w.XMLHttpRequest)) {
				useImg = true;
			}

			if (useImg) {
				//
				// Image beacon
				//

				// just in case Image isn't a valid constructor
				try {
					img = new Image();
				}
				catch (e) {

					return false;
				}

				img.src = url;
			}
			else {
				//
				// XHR beacon
				//

				// Send a form-encoded XHR POST beacon
				xhr = new (BOOMR.window.orig_XMLHttpRequest || BOOMR.orig_XMLHttpRequest || BOOMR.window.XMLHttpRequest)();
				try {
					this.sendXhrPostBeacon(xhr, paramsJoined);
				}
				catch (e) {
					// if we had an exception with the window XHR object, try our IFRAME XHR
					xhr = new BOOMR.boomerang_frame.XMLHttpRequest();
					this.sendXhrPostBeacon(xhr, paramsJoined);
				}
			}

			return true;
		},

		/**
		 * Determines whether or not a Page Load beacon has been sent.
		 *
		 * @returns {boolean} True if a Page Load beacon has been sent.
		 *
		 * @memberof BOOMR
		 */
		hasSentPageLoadBeacon: function() {
			return impl.hasSentPageLoadBeacon;
		},

		/**
		 * Sends a beacon via XMLHttpRequest
		 *
		 * @param {object} xhr XMLHttpRequest object
		 * @param {object} [paramsJoined] XMLHttpRequest.send() argument
		 *
		 * @memberof BOOMR
		 */
		sendXhrPostBeacon: function(xhr, paramsJoined) {
			xhr.open("POST", impl.beacon_url);

			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

			if (typeof impl.beacon_auth_token !== "undefined") {
				if (typeof impl.beacon_auth_key === "undefined") {
					impl.beacon_auth_key = "Authorization";
				}

				xhr.setRequestHeader(impl.beacon_auth_key, impl.beacon_auth_token);
			}

			if (impl.beacon_with_credentials) {
				xhr.withCredentials = true;
			}

			// console.log('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
			// console.log('~~ XHR data 보내는 부분 입니다. ~~~');
			// console.log(paramsJoined);

			xhr.send(paramsJoined);
		},

		/**
		 * Gets all variables of the specified priority
		 *
		 * @param {object} vars Variables (will be modified for pri -1 and 1)
		 * @param {number} pri Priority (-1, 0, or 1)
		 *
		 * @return {string[]} Array of URI-encoded vars
		 *
		 * @memberof BOOMR
		 */
		getVarsOfPriority: function(vars, pri) {
			var name, url = [],
			    // if we were given a priority, iterate over that list
			    // else iterate over vars
			    iterVars = (pri !== 0 ? impl.varPriority[pri] : vars);

			for (name in iterVars) {
				// if this var is set, add it to our URL array
				if (iterVars.hasOwnProperty(name) && vars.hasOwnProperty(name)) {
					url.push(this.getUriEncodedVar(name, typeof vars[name] === "undefined" ? "" : vars[name]));

					// remove this name from vars so it isn't also added
					// to the non-prioritized list when pri=0 is called
					if (pri !== 0) {
						delete vars[name];
					}
				}
			}

			return url;
		},

		/**
		 * Gets a URI-encoded name/value pair.
		 *
		 * @param {string} name Name
		 * @param {string} value Value
		 *
		 * @returns {string} URI-encoded string
		 *
		 * @memberof BOOMR
		 */
		getUriEncodedVar: function(name, value) {
			if (value === undefined || value === null) {
				value = "";
			}

			if (typeof value === "object") {
				value = BOOMR.utils.serializeForUrl(value);
			}

			var result = encodeURIComponent(name) +
				"=" + encodeURIComponent(value);

			return result;
		},

		/**
		 * Gets the latest ResourceTiming entry for the specified URL.
		 *
		 * Default sort order is chronological startTime.
		 *
		 * @param {string} url Resource URL
		 * @param {function} [sort] Sort the entries before returning the last one
		 * @param {function} [filter] Filter the entries. Will be applied before sorting
		 *
		 * @returns {PerformanceEntry|undefined} Entry, or undefined if ResourceTiming is not
		 *  supported or if the entry doesn't exist
		 *
		 * @memberof BOOMR
		 */
		getResourceTiming: function(url, sort, filter) {
			var entries, p = BOOMR.getPerformance();

			try {
				if (p && typeof p.getEntriesByName === "function") {
					entries = p.getEntriesByName(url);
					if (!entries || !entries.length) {
						return;
					}
					if (typeof filter === "function") {
						entries = BOOMR.utils.arrayFilter(entries, filter);
						if (!entries || !entries.length) {
							return;
						}
					}
					if (entries.length > 1 && typeof sort === "function") {
						entries.sort(sort);
					}
					return entries[entries.length - 1];
				}
			}
			catch (e) {
				BOOMR.warn("getResourceTiming:" + e);
			}
		}

	};

	// if not already set already on BOOMR, determine the URL
	if (!BOOMR.url) {
		boomr.url = boomr.utils.getMyURL();
	}
	else {
		// canonicalize the URL
		var a = BOOMR.window.document.createElement("a");
		a.href = BOOMR.url;
		boomr.url = a.href;
	}

	delete BOOMR_start;

	/**
	 * @global
	 * @type {TimeStamp}
	 * @name BOOMR_lstart
	 * @desc
	 * Time the loader script started fetching boomerang.js (if the asynchronous
	 * loader snippet is used).
	 */
	if (typeof BOOMR_lstart === "number") {
		/**
		 * Time the loader script started fetching boomerang.js (if using the
		 * asynchronous loader snippet) (`BOOMR_lstart`)
		 * @type {TimeStamp}
		 *
		 * @memberof BOOMR
		 */
		boomr.t_lstart = BOOMR_lstart;
		delete BOOMR_lstart;
	}
	else if (typeof BOOMR.window.BOOMR_lstart === "number") {
		boomr.t_lstart = BOOMR.window.BOOMR_lstart;
	}

	/**
	 * Time the `window.onload` event fired (if using the asynchronous loader snippet).
	 *
	 * This timestamp is logged in the case boomerang.js loads after the onload event
	 * for browsers that don't support NavigationTiming.
	 *
	 * @global
	 * @name BOOMR_onload
	 * @type {TimeStamp}
	 */
	if (typeof BOOMR.window.BOOMR_onload === "number") {
		/**
		 * Time the `window.onload` event fired (if using the asynchronous loader snippet).
		 *
		 * This timestamp is logged in the case boomerang.js loads after the onload event
		 * for browsers that don't support NavigationTiming.
		 *
		 * @type {TimeStamp}
		 * @memberof BOOMR
		 */
		boomr.t_onload = BOOMR.window.BOOMR_onload;
	}

	(function() {
		var make_logger;

		if (typeof console === "object" && console.log !== undefined) {
			/**
			 * Logs the message to the console
			 *
			 * @param {string} m Message
			 * @param {string} l Log level
			 * @param {string} [s] Source
			 *
			 * @function log
			 *
			 * @memberof BOOMR
			 */
			/*
			boomr.log = function(m, l, s) {
				console.log("(" + BOOMR.now() + ") " +
					"{" + BOOMR.pageId + "}" +
					": " + s +
					": [" + l + "] " +
					m);
			};
			*/
		}
		else {
			// NOP for browsers that don't support it
			boomr.log = function() {};
		}

		make_logger = function(l) {
			return function(m, s) {
				this.log(m, l, "boomerang" + (s ? "." + s : ""));
				return this;
			};
		};

		/**
		 * Logs debug messages to the console
		 *
		 * Debug messages are stripped out of production builds.
		 *
		 * @param {string} m Message
		 * @param {string} [s] Source
		 *
		 * @function debug
		 *
		 * @memberof BOOMR
		 */
		boomr.debug = make_logger("debug");

		/**
		 * Logs info messages to the console
		 *
		 * @param {string} m Message
		 * @param {string} [s] Source
		 *
		 * @function info
		 *
		 * @memberof BOOMR
		 */
		boomr.info = make_logger("info");

		/**
		 * Logs warning messages to the console
		 *
		 * @param {string} m Message
		 * @param {string} [s] Source
		 *
		 * @function warn
		 *
		 * @memberof BOOMR
		 */
		boomr.warn = make_logger("warn");

		/**
		 * Logs error messages to the console
		 *
		 * @param {string} m Message
		 * @param {string} [s] Source
		 *
		 * @function error
		 *
		 * @memberof BOOMR
		 */
		boomr.error = make_logger("error");
	}());

	// If the browser supports performance.now(), swap that in for BOOMR.now
	try {
		var p = boomr.getPerformance();
		if (p &&
		    typeof p.now === "function" &&
		    // #545 handle bogus performance.now from broken shims
		    /\[native code\]/.test(String(p.now)) &&
		    p.timing &&
		    p.timing.navigationStart) {
			boomr.now = function() {
				return Math.round(p.now() + p.timing.navigationStart);
			};
		}
	}
	catch (ignore) {
		// empty
	}

	impl.checkLocalStorageSupport();

	(function() {
		var ident;
		for (ident in boomr) {
			if (boomr.hasOwnProperty(ident)) {
				BOOMR[ident] = boomr[ident];
			}
		}

		if (!BOOMR.xhr_excludes) {
			/**
			 * URLs to exclude from automatic `XMLHttpRequest` instrumentation.
			 *
			 * You can put any of the following in it:
			 * * A full URL
			 * * A hostname
			 * * A path
			 *
			 * @example
			 *
			 * BOOMR.xhr_excludes = {
			 *   "mysite.com": true,
			 *   "/dashboard/": true,
			 *   "https://mysite.com/dashboard/": true
			 * };
			 *
			 * @memberof BOOMR
			 */
			BOOMR.xhr_excludes = {};
		}
	}());


	dispatchEvent("onBoomerangLoaded", { "BOOMR": BOOMR }, true);

}(window));


// end of boomerang beaconing section


/**
 * Instrument and measure `XMLHttpRequest` (AJAX) requests.
 *
 * With this plugin, sites can measure the performance of `XMLHttpRequests`
 * (XHRs) and other in-page interactions after the page has been loaded.
 *
 * This plugin also monitors DOM manipulations following a XHR to filter out
 * "background" XHRs.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## What is Measured
 *
 * When `AutoXHR` is enabled, this plugin will monitor several events:
 *
 * - `XMLHttpRequest` requests
 * - `Fetch` API requests
 * - Clicks
 * - `window.History` changes indirectly through SPA plugins (History, Angular, etc.)
 *
 * When any of these events occur, `AutoXHR` will start monitoring the page for
 * other events, DOM manipulations and other networking activity.
 *
 * As long as the event isn't determined to be background activity (i.e an XHR
 * that didn't change the DOM at all), the event will be measured until all networking
 * activity has completed.
 *
 * This means if your click generated an XHR that triggered an updated view to fetch
 * more HTML that added images to the page, the entire event will be measured
 * from the click to the last image completing.
 *
 * ## Usage
 *
 * To enable AutoXHR, you should set {@link BOOMR.plugins.AutoXHR.init|instrument_xhr} to `true`:
 *
 *     BOOMR.init({
 *       instrument_xhr: true
 *     });
 *
 * Once enabled and initialized, the `window.XMLHttpRequest` object will be
 * replaced with a "proxy" object that instruments all XHRs.
 *
 * ## Monitoring XHRs
 *
 * After `AutoXHR` is enabled, any `XMLHttpRequest.send` will be monitored:
 *
 *     xhr = new XMLHttpRequest();
 *     xhr.open("GET", "/api/foo");
 *     xhr.send(null);
 *
 * If this XHR triggers DOM changes, a beacon will eventually be sent.
 *
 * This beacon will have `http.initiator=xhr` and the beacon parameters will differ
 * from a Page Load beacon.  See {@link BOOMR.plugins.RT} and
 * {@link BOOMR.plugins.NavigationTiming} for details.
 *
 * ## Combining XHR Beacons
 *
 * By default `AutoXHR` groups all XHR activity that happens in the same event together.
 *
 * If you have one XHR that immediately triggers a second XHR, you will get a single
 * XHR beacon.  The `u` (URL) will be of the first XHR.
 *
 * If you don't want this behavior, and want to measure *every* XHR on the page, you
 * can enable {@link BOOMR.plugins.AutoXHR.init|alwaysSendXhr=true}.  When set, every
 * distinct XHR will get its own XHR beacon.
 * {@link BOOMR.plugins.AutoXHR.init|alwaysSendXhr} can also be a list of strings
 * (matching URLs), regular expressions (matching URLs), or a function which returns
 * true for URLs to always send XHRs for.
 *
 * ### Compatibility and Browser Support
 *
 * Currently supported Browsers and platforms that AutoXHR will work on:
 *
 * - IE 9+ (not in quirks mode)
 * - Chrome 38+
 * - Firefox 25+
 *
 * In general we support all browsers that support
 * [MutationObserver]{@link https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver}
 * and [XMLHttpRequest]{@link https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest}.
 *
 * We will not use MutationObserver in IE 11 due to several browser bugs.
 * See {@link BOOMR.utils.isMutationObserverSupported} for details.
 *
 * ## Excluding Certain Requests From Instrumentation
 *
 * Whenever Boomerang intercepts an `XMLHttpRequest`, it will check if that request
 * matches anything in the XHR exclude list. If it does, Boomerang will not
 * instrument, time, send a beacon for that request, or include it in the
 * {@link BOOMR.plugins.SPA} calculations.
 *
 * The XHR exclude list is defined by creating an `BOOMR.xhr_excludes` map, and
 * adding URL parts that you would like to exclude from instrumentation. You
 * can put any of the following in `BOOMR.xhr_excludes`:
 *
 * 1. A full HREF
 * 2. A hostname
 * 3. A path
 *
 * Example:
 *
 * ```
 *
 *
 * BOOMR.xhr_excludes = {
 *   "www.mydomain.com":  true,
 *   "a.anotherdomain.net": true,
 *   "/api/v1/foobar":  true,
 *   "https://mydomain.com/dashboard/": true
 * };
 * ```
 *
 * ## Beacon Parameters
 *
 * XHR beacons have different parameters in general than Page Load beacons.
 *
 * - Many of the timestamps will differ, see {@link BOOMR.plugins.RT}
 * - All of the `nt_*` parameters are ResourceTiming, see {@link BOOMR.plugins.NavigationTiming}
 * - `u`: the URL of the resource that was fetched
 * - `pgu`: The URL of the page the resource was fetched on
 * - `http.initiator`: `xhr` for both XHR and Fetch requests
 *
 * ## Interesting Nodes
 *
 * MutationObserver is used to detect "interesting" nodes. Interesting nodes are
 * new IMG/IMAGE/IFRAME/LINK (rel=stylesheet) nodes or existing nodes that are
 * changing their source URL.
 * We consider the following "uninteresting" nodes:
 *   - Nodes that have either a width or height <= 1px.
 *   - Nodes that have display:none.
 *   - Nodes that have visibility:hidden.
 *   - Nodes that update their source URL to the same value.
 *   - Nodes that have a blank source URL.
 *   - Nodes that have a source URL starting with `about:`, `javascript:` or `data:`.
 *   - SCRIPT nodes because there is no consistent way to detect when they have loaded.
 *   - Existing IFRAME nodes that are changing their source URL because is no consistent
 *     way to detect when they have loaded.
 *   - Nodes that have a source URL that matches a AutoXHR exclude filter rule.
 *
 * ## Algorithm
 *
 * Here's how the general AutoXHR algorithm works:
 *
 * - `0.0` SPA hard route change (page navigation)
 *
 *   - Monitor for XHR resource requests and interesting Mutation resource requests
 *     for 1s or at least until page onload. We extend our 1s timeout after all
 *     interesting resource requests have completed.
 *
 * - `0.1` SPA soft route change from a synchronous call (eg. History changes as a
 *         result of a pushState or replaceState call)
 *
 *   - In this case we get the new URL when the developer calls pushState or
 *     replaceState.
 *   - We create a pending event with the start time and the new URL.
 *   - We do not know if they plan to make an XHR call or use a dynamic script
 *     node, or do nothing interesting (eg: just make a div visible/invisible).
 *   - We also do not know if they will do this before or after they've called
 *     pushState/replaceState.
 *   - Our best bet is to monitor if either a XHR resource requests or interesting
 *     Mutation resource requests will happen in the next 1s.
 *   - When interesting resources are detected, we wait until they complete.
 *   - We restart our 1s timeout after all interesting resources have completed.
  *  - If something uninteresting happens, we set the timeout for 1 second if
 *     it wasn't already started.
 *       - We'll only do this once per event since we don't want to continuously
 *         extend the timeout with each uninteresting event.
 *   - If nothing happens during the additional timeout, we stop watching and fire the
 *     event. The event end time will be end time of the last tracked resource.
 *   - If nothing interesting was detected during the first timeout and the URL has not
 *     changed then we drop the event.
 *
 * - `0.2` SPA soft route change from an asynchronous call (eg. History changes as a
 *         result of the user hitting Back/Forward and we get a window.popstate event)
 *
 *   - In this case we get the new URL from location.href when our event listener
 *     runs.
 *   - We do not know if this event change will result in some interesting network
 *     activity or not.
 *   - We do not know if the developer's event listener has already run before
 *     ours or if it will run in the future or even if they do have an event listener.
 *   - Our best bet is the same as 0.1 above.
 *
 * - `1` Click initiated (Only available when no SPA plugins are enabled)
 *
 *   - User clicks on something.
 *   - We create a pending event with the start time and no URL.
 *   - We turn on DOM observer, and wait up to 50 milliseconds for activity.
 *     - If nothing happens during the first timeout, we stop watching and clear the
 *       event without firing it.
 *     - Else if something uninteresting happens, we set the timeout for 1s
 *       if it wasn't already started.
 *       - We'll only do this once per event since we don't want to continuously
 *         extend the timeout with each uninteresting event.
 *     - Else if an interesting node is added, we add load and error listeners
 *       and turn off the timeout but keep watching.
 *       - Once all listeners have fired, we start waiting again up to 50ms for activity.
 *     - If nothing happens during the additional timeout, we stop watching and fire the event.
 *
 * - `2` XHR/Fetch initiated
 *
 *   - XHR or Fetch request is sent.
 *   - We create a pending event with the start time and the request URL.
 *   - We watch for all changes in XHR state (for async requests) and for load (for
 *     all requests).
 *   - We turn on DOM observer at XHR Onload or when the Fetch Promise resolves.
 *     We then wait up to 50 milliseconds for activity.
 *     - If nothing happens during the first timeout, we stop watching and clear the
 *       event without firing it.
 *     - If something uninteresting happens, we set the timeout for 1 second if
 *       it wasn't already started.
 *       - We'll only do this once per event since we don't want to continuously
 *         extend the timeout with each uninteresting event.
 *     - Else if an interesting node is added, we add load and error listeners
 *       and turn off the timeout.
 *       - Once all listeners have fired, we start waiting again up to 50ms for activity.
 *     - If nothing happens during the additional timeout, we stop watching and fire the event.
 *
 * What about overlap?
 *
 * - `3.1` XHR/Fetch initiated while a click event is pending
 *
 *   - If first click watcher has not detected anything interesting or does not
 *     have a URL, abort it
 *   - If the click watcher has detected something interesting and has a URL, then
 *     - Proceed with 2 above.
 *     - Concurrently, click stops watching for new resources
 *       - Once all resources click is waiting for have completed then fire the event.
 *
 * - `3.2` Click initiated while XHR/Fetch event is pending
 *
 *   - Ignore click
 *
 * - `3.3` Click initiated while a click event is pending
 *
 *   - If first click watcher has not detected anything interesting or does not
 *     have a URL, abort it.
 *   - Else proceed with parallel event steps from 3.1 above.
 *
 * - `3.4` XHR/Fetch initiated while an XHR/Fetch event is pending
 *
 *   - Add the second XHR/Fetch as an interesting resource to be tracked by the
 *     XHR pending event in progress.
 *
 * - `3.5` XHR/Fetch initiated while SPA event is pending
 *
 *   - Add the second XHR/Fetch as an interesting resource to be tracked by the
 *     XHR pending event in progress.
 *
 * - `3.6` SPA event initiated while an XHR event is pending
 *     - Proceed with 0 above.
 *     - Concurrently, XHR event stops watching for new resources. Once all resources
 *       the XHR event is waiting for have completed, fire the event.
 *
 * - `3.7` SPA event initiated while a SPA event is pending
 *     - If the pending SPA event had detected something interesting then send an aborted
 *       SPA beacon. If not, drop the pending event.
 *     - Proceed with 0 above.
 *
 * @class BOOMR.plugins.AutoXHR
 */
(function() {
	var w, d, handler, a, impl,
	    readyStateMap = ["uninitialized", "open", "responseStart", "domInteractive", "responseEnd"];

	/**
	 * Single Page Applications get an additional timeout for all XHR Requests to settle in.
	 * This is used after collecting resources for a SPA routechange.
	 * Default is 1000ms, overridable with spaIdleTimeout
	 * @type {number}
	 * @constant
	 * @default
	 */
	var SPA_TIMEOUT = 1000;

	/**
	 * Clicks and XHR events get 50ms for an interesting thing to happen before
	 * being cancelled.
	 * Default is 50ms, overridable with xhrIdleTimeout
	 * @type {number}
	 * @constant
	 * @default
	 */
	var CLICK_XHR_TIMEOUT = 50;


	/**
	 * Fetch events that don't read the body of the response get an extra wait time before
	 * we look for it's corresponding ResourceTiming entry.
	 * Default is 200ms, overridable with fetchBodyUsedWait
	 * @type {number}
	 * @constant
	 * @default
	 */
	var FETCH_BODY_USED_WAIT_DEFAULT = 200;

	/**
	 * If we get a Mutation event that doesn't have any interesting nodes after
	 * a Click or XHR event started, wait up to 1,000ms for an interesting one
	 * to happen before cancelling the event.
	 * @type {number}
	 * @constant
	 * @default
	 */
	var UNINTERESTING_MUTATION_TIMEOUT = 1000;

	/**
	 * How long to wait if we're not ready to send a beacon to try again.
	 * @constant
	 * @type {number}
	 * @default
	 */
	var READY_TO_SEND_WAIT = 500;

	/**
	 * Timeout event fired for XMLHttpRequest resource
	 * @constant
	 * @type {number}
	 * @default
	 */
	var XHR_STATUS_TIMEOUT        = -1001;

	/**
	 * XMLHttpRequest was aborted
	 * @constant
	 * @type {number}
	 * @default
	 */
	var XHR_STATUS_ABORT          = -999;

	/**
	 * An error occured fetching XMLHttpRequest/Fetch resource
	 * @constant
	 * @type {number}
	 * @default
	 */
	var XHR_STATUS_ERROR          = -998;

	/**
	 * An exception occured as we tried to request resource
	 * @constant
	 * @type {number}
	 * @default
	 */
	var XHR_STATUS_OPEN_EXCEPTION = -997;

	// Default resources to count as Back-End during a SPA nav
	var SPA_RESOURCES_BACK_END = ["xmlhttprequest", "script", "fetch"];

	if (BOOMR.plugins.AutoXHR) {
		return;
	}

	w = BOOMR.window;

	// If this browser cannot support XHR, we'll just skip this plugin which will
	// save us some execution time.

	// XHR not supported or XHR so old that it doesn't support addEventListener
	// (IE 6, 7, 8, as well as newer running in quirks mode.)
	if (!w || !w.XMLHttpRequest || !(new w.XMLHttpRequest()).addEventListener) {
		// Nothing to instrument
		return;
	}


	/**
	 * Tries to resolve `href` links from relative URLs.
	 *
	 * This implementation takes into account a bug in the way IE handles relative
	 * paths on anchors and resolves this by assigning `a.href` to itself which
	 * triggers the URL resolution in IE and will fix missing leading slashes if
	 * necessary.
	 *
	 * @param {string} anchor The anchor object to resolve
	 *
	 * @returns {string} The unrelativized URL href
	 * @memberof BOOMR.plugins.AutoXHR
	 */
	function getPathName(anchor) {
		if (!anchor) {
			return null;
		}

		/*
		 correct relativism in IE
		 anchor.href = "./path/file";
		 anchor.pathname == "./path/file"; //should be "/path/file"
		 */
		anchor.href = anchor.href;

		/*
		 correct missing leading slash in IE
		 anchor.href = "path/file";
		 anchor.pathname === "path/file"; //should be "/path/file"
		 */
		var pathName = anchor.pathname;
		if (pathName.charAt(0) !== "/") {
			pathName = "/" + pathName;
		}

		return pathName;
	}

	/**
	 * Based on the contents of BOOMR.xhr_excludes check if the URL that we instrumented as XHR request
	 * matches any of the URLs we are supposed to not send a beacon about.
	 *
	 * @param {HTMLAnchorElement} anchor HTML anchor element with URL of the element
	 * checked against `BOOMR.xhr_excludes`
	 *
	 * @returns {boolean} `true` if intended to be excluded, `false` if it is not in the list of excludables
	 * @memberof BOOMR.plugins.AutoXHR
	 */
	function shouldExcludeXhr(anchor) {
		var urlIdx;

		if (anchor.href) {
			if (anchor.href.match(/^(about:|javascript:|data:)/i)) {
				return true;
			}

			// don't track our own beacons (allow for protocol-relative URLs)
			if (typeof BOOMR.getBeaconURL === "function" && BOOMR.getBeaconURL()) {
				urlIdx = anchor.href.indexOf(BOOMR.getBeaconURL());
				if (urlIdx === 0 || urlIdx === 5 || urlIdx === 6) {
					return true;
				}
			}
		}

		return BOOMR.xhr_excludes.hasOwnProperty(anchor.href) ||
			BOOMR.xhr_excludes.hasOwnProperty(anchor.hostname) ||
			BOOMR.xhr_excludes.hasOwnProperty(getPathName(anchor));
	}

	/**
	 * Handles the MutationObserver for {@link BOOMR.plugins.AutoXHR}.
	 *
	 * @class MutationHandler
	 */
	function MutationHandler() {
		this.watch = 0;
		this.timer = null;

		this.pending_events = [];
		this.lastSpaLocation = null;
	}

	/**
	 * Disable internal MutationObserver instance. Use this when uninstrumenting the site we're on.
	 *
	 * @method
	 * @memberof MutationHandler
	 * @static
	 */
	MutationHandler.stop = function() {
		MutationHandler.pause();
		MutationHandler.observer = null;
	};

	/**
	 * Pauses the MutationObserver.  Call [resume]{@link handler#resume} to start it back up.
	 *
	 * @method
	 * @memberof MutationHandler
	 * @static
	 */
	MutationHandler.pause = function() {
		if (MutationHandler.observer &&
		    MutationHandler.observer.observer &&
		    !MutationHandler.isPaused) {
			MutationHandler.isPaused = true;
			MutationHandler.observer.observer.disconnect();
		}
	};

	/**
	 * Resumes the MutationObserver after a [pause]{@link handler#pause}.
	 *
	 * @method
	 * @memberof MutationHandler
	 * @static
	 */
	MutationHandler.resume = function() {
		if (MutationHandler.observer &&
		    MutationHandler.observer.observer &&
		    MutationHandler.isPaused) {
			MutationHandler.isPaused = false;
			MutationHandler.observer.observer.observe(d, MutationHandler.observer.config);
		}
	};

	/**
	 * Initiate {@link MutationHandler.observer} on the
	 * [outer parent document]{@link BOOMR.window.document}.
	 *
	 * Uses [addObserver]{@link BOOMR.utils.addObserver} to instrument.
	 *
	 * [Our internal handler]{@link handler#mutation_cb} will be called if
	 * something happens.
	 *
	 * @method
	 * @memberof MutationHandler
	 * @static
	 */
	MutationHandler.start = function() {
		if (MutationHandler.observer) {
			// don't start twice
			return;
		}

		var config = {
			childList: true,
			attributes: true,
			subtree: true,
			attributeFilter: ["src", "href"]
		};

		// Add a perpetual observer
		MutationHandler.observer = BOOMR.utils.addObserver(
			d,
			config,
			null, // no timeout
			handler.mutation_cb, // will always return true
			null, // no callback data
			handler
		);

		if (MutationHandler.observer) {
			MutationHandler.observer.config = config;

			BOOMR.subscribe("page_unload", MutationHandler.stop, null, MutationHandler);
		}
	};

	/**
	 * If an event has triggered a resource to be fetched we add it to the list of pending events
	 * here and wait for it to eventually resolve.
	 *
	 * @param {object} resource - [Resource]{@link AutoXHR#Resource} object we are waiting for
	 *
	 * @returns {?index} If we are already waiting for an event of this type null
	 * otherwise index in the [queue]{@link MutationHandler#pending_event}.
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.addEvent = function(resource) {
		var ev = {
			type: resource.initiator,
			resource: resource,
			nodes_to_wait: 0,  // MO resources + xhrs currently outstanding + wait filter (max: 1)
			total_nodes: 0,  // total MO resources + xhrs + wait filter (max: 1)
			resources: [],  // resources reported to MO handler (no xhrs)
			aborted: false,  // this event was aborted
			complete: false
		},
		    i,
		    last_ev,
		    last_ev_index,
		    index = this.pending_events.length,
		    self = this;

		for (i = index - 1; i >= 0; i--) {
			if (this.pending_events[i] && !this.pending_events[i].complete) {
				last_ev = this.pending_events[i];
				last_ev_index = i;
				break;
			}
		}

		if (last_ev) {
			if (last_ev.type === "click") {
				// 3.1 & 3.3
				if (last_ev.nodes_to_wait === 0 || !last_ev.resource.url) {
					this.pending_events[last_ev_index] = undefined;
					this.watch--;
					// continue with new event
				}
				// last_ev will no longer receive watches as ev will receive them
				// last_ev will wait for all interesting nodes and then send event
			}
			else if (last_ev.type === "xhr") {
				// 3.2
				if (ev.type === "click") {
					return null;
				}

				// 3.4
				// add this resource to the current event
				else if (ev.type === "xhr") {
					handler.add_event_resource(resource);
					return null;
				}

			}
			else if (BOOMR.utils.inArray(last_ev.type, BOOMR.constants.BEACON_TYPE_SPAS)) {
				// add this resource to the current event
				if (ev.type === "xhr") {
					handler.add_event_resource(resource);
					return null;
				}

				// if we have a pending SPA event, send an aborted load beacon before
				// adding the new SPA event
				if (BOOMR.utils.inArray(ev.type, BOOMR.constants.BEACON_TYPE_SPAS)) {


					// mark the end of this navigation as now
					last_ev.resource.timing.loadEventEnd = BOOMR.now();
					last_ev.aborted = true;

					// send the previous SPA
					this.sendEvent(last_ev_index);
				}
			}
		}

		if (ev.type === "click") {
			// if we don't have a MutationObserver then we just abort.
			// If an XHR starts later then it will be tracked as its own new event
			if (!MutationHandler.observer) {
				return null;
			}

			// give Click events 50ms to see if they resulted
			// in DOM mutations (and thus it is an 'interesting event').
			this.setTimeout(impl.xhrIdleTimeout, index);
		}
		else if (ev.type === "xhr") {
			// XHR events will not set a timeout yet.
			// The XHR's load finished callback will start the timer.
			// Increase node count since we are waiting for the XHR that started this event
			ev.nodes_to_wait++;
			ev.total_nodes++;
			// we won't track mutations yet, we'll monitor only when at least one of the
			// tracked xhr nodes has had a response
			ev.ignoreMO = true;
		}
		else if (BOOMR.utils.inArray(ev.type, BOOMR.constants.BEACON_TYPE_SPAS)) {
			// try to start the MO, in case we haven't had the chance to yet
			MutationHandler.start();

			if (!resource.wait) {
				// give SPAs a bit more time to do something since we know this was
				// an interesting event.
				this.setTimeout(impl.spaIdleTimeout, index);
			}
			else {
				// a wait filter isn't a node, but we'll use the same logic.
				// Increase node count since we are waiting for the waitComplete call.
				ev.nodes_to_wait++;
				ev.total_nodes++;
				// waitComplete() should be called once the held beacon is complete.
				// The caller is responsible for clearing the .wait flag
				resource.waitComplete = function() {
					self.load_finished(index);
					resource.waitComplete = undefined;
				};
			}
		}

		this.watch++;
		this.pending_events.push(ev);
		resource.index = index;

		return index;
	};

	/**
	 * If called with an event in the [pending events list]{@link MutationHandler#pending_events}
	 * trigger a beacon for this event.
	 *
	 * When the beacon is sent for this event is depending on either having a crumb, in which case this
	 * beacon will be sent immediately. If that is not the case we wait 5 seconds and attempt to send the
	 * event again.
	 *
	 * @param {number} index Index in event list to send
	 *
	 * @returns {undefined} Returns early if the event already completed
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.sendEvent = function(index) {
		var ev = this.pending_events[index], self = this, now = BOOMR.now();

		if (!ev || ev.complete) {
			return;
		}

		this.clearTimeout(index);
		if (BOOMR.readyToSend()) {
			ev.complete = true;

			this.watch--;

			ev.resource.resources = ev.resources;

			// for SPA events, the resource's URL may be set to the previous navigation's URL.
			// reset it to the current document URL
			if (BOOMR.utils.inArray(ev.type, BOOMR.constants.BEACON_TYPE_SPAS)) {
				ev.resource.url = d.URL;
			}

			// if this was a SPA soft nav with no URL change and did not trigger additional resources
			// then we will not send a beacon
			if (ev.type === "spa" && ev.total_nodes === 0 && ev.resource.url === self.lastSpaLocation) {

				BOOMR.fireEvent("spa_cancel");
				this.pending_events[index] = undefined;
				return;
			}

			if (BOOMR.utils.inArray(ev.type, BOOMR.constants.BEACON_TYPE_SPAS)) {
				// save the last SPA location
				self.lastSpaLocation = ev.resource.url;

				// if this was a SPA nav that triggered no additional resources, substract the
				// SPA_TIMEOUT from now to determine the end time
				if (!ev.forced && ev.total_nodes === 0) {
					ev.resource.timing.loadEventEnd = now - impl.spaIdleTimeout;
				}
			}

			this.sendResource(ev.resource, index);
		}
		else {
			// No crumb, so try again after 500ms seconds
			setTimeout(function() { self.sendEvent(index); }, READY_TO_SEND_WAIT);
		}
	};

	/**
	 * Creates and triggers sending a beacon for a Resource that has finished loading.
	 *
	 * @param {Resource} resource The Resource to send a beacon on
	 * @param {number} eventIndex index of the event in the pending_events array
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.sendResource = function(resource, eventIndex) {
		var self = this, ev = self.pending_events[eventIndex];

		// Use 'requestStart' as the startTime of the resource, if given
		var startTime = resource.timing ? resource.timing.requestStart : undefined;

		/**
		  * Called once the resource can be sent
		  * @param {boolean} [markEnd] Sets loadEventEnd once the function is run
		  * @param {number} [endTimestamp] End timestamp
		 */
		var sendResponseEnd = function(markEnd, endTimestamp) {
			if (markEnd) {
				resource.timing.loadEventEnd = endTimestamp || BOOMR.now();
			}

			// send any queued beacons first
			BOOMR.real_sendBeacon();

			// If the resource has an onComplete event, trigger it.
			if (resource.onComplete) {
				resource.onComplete(resource);
			}

			// Add ResourceTiming data to the beacon, starting at when 'requestStart'
			// was for this resource.
			if (BOOMR.plugins.ResourceTiming &&
			    BOOMR.plugins.ResourceTiming.is_enabled() &&
			    resource.timing &&
			    resource.timing.requestStart) {
				var r = BOOMR.plugins.ResourceTiming.getCompressedResourceTiming(
						resource.timing.requestStart,
						resource.timing.loadEventEnd
					);

				BOOMR.plugins.ResourceTiming.addToBeacon(r);
			}

			// For SPAs, calculate Back-End and Front-End timings
			if (BOOMR.utils.inArray(resource.initiator, BOOMR.constants.BEACON_TYPE_SPAS)) {
				self.calculateSpaTimings(resource);

				// If the SPA load was aborted, set the rt.quit and rt.abld flags
				if (typeof eventIndex === "number" && self.pending_events[eventIndex].aborted) {
					// Save the URL otherwise it might change before we have a chance to put it on the beacon
					BOOMR.addVar("pgu", d.URL);
					BOOMR.addVar("rt.quit", "");
					BOOMR.addVar("rt.abld", "");

					impl.addedVars.push("pgu", "rt.quit", "rt.abld");
				}
			}

			BOOMR.responseEnd(resource, startTime, resource);

			if (typeof eventIndex === "number") {
				self.pending_events[eventIndex] = undefined;
			}
		};

		// if this is a SPA Hard navigation, make sure it doesn't fire until onload
		if (resource.initiator === "spa_hard") {
			// don't wait for onload if this was an aborted SPA navigation
			if ((!ev || !ev.aborted) && !BOOMR.hasBrowserOnloadFired()) {
				BOOMR.utils.addListener(w, "load", function() {
					var loadTimestamp = BOOMR.now();

					// run after the 'load' event handlers so loadEventEnd is captured
					BOOMR.setImmediate(function() {
						sendResponseEnd(true, loadTimestamp);
					});
				});

				return;
			}
		}

		sendResponseEnd(false);
	};

	/**
	 * Calculates SPA Back-End and Front-End timings for Hard and Soft
	 * SPA navigations.
	 *
	 * @param {object} resource Resouce to calculate for
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.calculateSpaTimings = function(resource) {
		var p = BOOMR.getPerformance();
		if (!p || !p.timing) {
			return;
		}

		//
		// Hard Navigation:
		// Use same timers as a traditional navigation, where the root HTML's
		// timestamps are used for Back-End calculation.
		//
		if (resource.initiator === "spa_hard") {
			// ensure RT picks up the correct timestamps
			resource.timing.responseEnd = p.timing.responseStart;

			// use navigationStart instead of fetchStart to ensure Back-End time
			// includes any redirects
			resource.timing.fetchStart = p.timing.navigationStart;
		}
		else {
			//
			// Soft Navigation:
			// We need to overwrite two timers: Back-End (t_resp) and Front-End (t_page).
			//
			// For Single Page Apps, we're defining these as:
			// Back-End: Any timeslice where a XHR or JavaScript was outstanding
			// Front-End: Total Time - Back-End
			//
			if (!BOOMR.plugins.ResourceTiming ||
			    !BOOMR.plugins.ResourceTiming.is_supported()) {
				return;
			}

			// first, gather all Resources that were outstanding during this SPA nav
			var resources = BOOMR.plugins.ResourceTiming.getFilteredResourceTiming(
				resource.timing.requestStart,
				resource.timing.loadEventEnd,
				impl.spaBackEndResources).entries;

			// determine the total time based on the SPA logic
			var totalTime = Math.round(resource.timing.loadEventEnd - resource.timing.requestStart);

			if (!resources || !resources.length) {
				// If ResourceTiming is supported, but there were no entries,
				// this was all Front-End time
				resource.timers = {
					t_resp: 0,
					t_page: totalTime,
					t_done: totalTime
				};

				return;
			}

			// we currently can't reliably tell when a SCRIPT has loaded
			// set an upper bound on responseStart/responseEnd for the resources to the SPA's loadEventEnd
			var maxResponseEnd = resource.timing.loadEventEnd - p.timing.navigationStart;
			for (var i = 0; i < resources.length; i++) {
				if (resources[i].responseStart > maxResponseEnd) {
					resources[i].responseStart = maxResponseEnd;
					resources[i].responseEnd = maxResponseEnd;
				}
				else if (resources[i].responseEnd > maxResponseEnd) {
					resources[i].responseEnd = maxResponseEnd;
				}
			}

			// calculate the Back-End time based on any time those resources were active
			var backEndTime = Math.round(BOOMR.plugins.ResourceTiming.calculateResourceTimingUnion(resources));

			// front-end time is anything left over
			var frontEndTime = totalTime - backEndTime;

			if (backEndTime < 0 || totalTime < 0 || frontEndTime < 0) {
				// some sort of error, don't put on the beacon
				BOOMR.addError("Incorrect SPA time calculation");
				return;
			}

			// set timers on the resource so RT knows to use them
			resource.timers = {
				t_resp: backEndTime,
				t_page: frontEndTime,
				t_done: totalTime
			};
		}
	};

	/**
	 * Will create a new timer waiting for `timeout` milliseconds to wait until a
	 * resources load time has ended or should have ended. If the timeout expires
	 * the Resource at `index` will be marked as timedout and result in an error Resource marked with
	 * [XHR_STATUS_TIMEOUT]{@link AutoXHR#XHR_STATUS_TIMEOUT} as status information.
	 *
	 * @param {number} timeout - time ot wait for the resource to be loaded
	 * @param {number} index - Index of the {@link Resource} in our {@link MutationHandler#pending_events}
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.setTimeout = function(timeout, index) {
		var self = this;
		// we don't need to check if this is the latest pending event, the check is
		// already done by all callers of this function
		if (!timeout) {
			return;
		}

		this.clearTimeout(index);

		this.timer = setTimeout(function() { self.timedout(index); }, timeout);
	};

	/**
	 * Sends a Beacon for the [Resource]{@link AutoXHR#Resource} at `index` with the status
	 * [XHR_STATUS_TIMEOUT]{@link AutoXHR#XHR_STATUS_TIMEOUT} code, If there are multiple resources attached to the
	 * `pending_events` array at `index`.
	 *
	 * @param {number} index - Index of the event in pending_events array
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.timedout = function(index) {
		var ev;
		this.clearTimeout(index);

		ev = this.pending_events[index];

		if (ev) {
			if (ev.nodes_to_wait === 0) {
				// TODO, if xhr event did not trigger additional resources then do not
				// send a beacon unless it matches alwaysSendXhr. See !868

				// if click event did not trigger additional resources or doesn't have
				// a url then do not send a beacon
				if (ev.type === "click" && (ev.total_nodes === 0 || !ev.resource.url)) {
					this.watch--;
					this.pending_events[index] = undefined;
				}
				// send event if there are no outstanding downloads
				this.sendEvent(index);
			}

			// if there are outstanding downloads left, they will trigger a
			// sendEvent for the SPA/XHR pending event once complete
		}
	};

	/**
	 * If this instance of the {@link MutationHandler} has a `timer` set, clear it
	 *
	 * @param {number} index - Index of the event in pending_events array
	 *
	 * @memberof MutationHandler
	 * @method
	 */
	MutationHandler.prototype.clearTimeout = function(index) {
		// only clear timeout if this is the latest pending event.
		// If it is not the latest, then allow the timer to timeout. This can
		// happen in cases of concurrency, eg. an xhr event is waiting in timeout and
		// a spa event is triggered.
		if (this.timer && index === (this.pending_events.length - 1)) {
			clearTimeout(this.timer);
			this.timer = null;
		}
	};

	/**
	 * Once an asset has been loaded and the resource appeared in the page we
	 * check if it was part of the interesting events on the page and mark it as finished.
	 *
	 * @callback load_cb
	 * @param {Event} ev - Load event Object
	 *
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.load_cb = function(ev, resourceNum) {
		var target, index, now = BOOMR.now();

		target = ev.target || ev.srcElement;
		if (!target || !target._bmr) {
			return;
		}

		index = target._bmr.idx;
		resourceNum = typeof resourceNum !== "undefined" ? resourceNum : (target._bmr.res || 0);

		if (target._bmr.end[resourceNum]) {
			// If we've already set the end value, don't call load_finished
			// again.  This might occur on IMGs that are 404s, which fire
			// 'error' then 'load' events
			return;
		}

		target._bmr.end[resourceNum] = now;

		this.load_finished(index, now);
	};

	/**
	 * Clear the flag preventing DOM mutation monitoring
	 *
	 * @param {number} index - Index of the event in pending_events array
	 *
	 * @memberof MutationHandler
	 * @method
	 */
	MutationHandler.prototype.monitorMO = function(index) {
		var current_event = this.pending_events[index];

		// event aborted
		if (!current_event) {
			return;
		}

		delete current_event.ignoreMO;
	};

	/**
	 * Decrement the number of [nodes_to_wait]{@link AutoXHR#.PendingEvent} for the
	 * [PendingEvent Object]{@link AutoXHR#.PendingEvent}.
	 *
	 * If the nodes_to_wait is decremented to 0 and the event type was SPA:
	 *
	 * When we're finished waiting on the last node,
	 * the MVC engine (eg AngularJS) might still be doing some processing (eg
	 * on an XHR) before it adds some additional content (eg IMGs) to the page.
	 * We should wait a while (1 second) longer to see if this happens.  If
	 * something else is added, we'll continue to wait for that content to
	 * complete.  If nothing else is added, the end event will be the
	 * timestamp for when this load_finished(), not 1 second from now.
	 *
	 * @param {number} index - Index of the event found in the pending_events array
	 * @param {TimeStamp} loadEventEnd - TimeStamp at which the resource was finished loading
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.load_finished = function(index, loadEventEnd) {
		var current_event = this.pending_events[index];

		// event aborted
		if (!current_event) {
			return;
		}

		current_event.nodes_to_wait--;

		if (current_event.nodes_to_wait === 0) {
			// mark the end timestamp with what was given to us, or, now
			current_event.resource.timing.loadEventEnd = loadEventEnd || BOOMR.now();

			// For Single Page Apps, when we're finished waiting on the last node,
			// the MVC engine (eg AngularJS) might still be doing some processing (eg
			// on an XHR) before it adds some additional content (eg IMGs) to the page.
			// We should wait a while (1 second) longer to see if this happens.  If
			// something else is added, we'll continue to wait for that content to
			// complete.  If nothing else is added, the end event will be the
			// timestamp for when this load_finished(), not 1 second from now.

			// We use the same behavior for XHR and click events but with a smaller timeout

			if (index === (this.pending_events.length - 1)) {
				// if we're the latest pending event then extend the timeout
				if (BOOMR.utils.inArray(current_event.type, BOOMR.constants.BEACON_TYPE_SPAS)) {
					this.setTimeout(impl.spaIdleTimeout, index);
				}
				else {
					this.setTimeout(impl.xhrIdleTimeout, index);
				}
			}
			else {
				// this should never happen for SPA events, they should always be the latest
				// pending event.
				this.sendEvent(index);
			}
		}
	};

	/**
	 * Determines if we should wait for resources that would be fetched by the
	 * specified node.
	 *
	 * @param {Element} node DOM node
	 * @param {number} index Event index
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.wait_for_node = function(node, index) {
		var self = this, current_event, els, interesting = false, i, l, url,
		    exisitingNodeSrcUrlChanged = false, resourceNum, domHeight, domWidth, listener;

		// only images, iframes and links if stylesheet
		// nodeName for SVG:IMAGE returns `image` in lowercase
		// scripts would be nice to track but their onload event is not reliable
		if (node && node.nodeName &&
		    (node.nodeName.toUpperCase().match(/^(IMG|IFRAME|IMAGE)$/) ||
		    (node.nodeName.toUpperCase() === "LINK" && node.rel && node.rel.match(/\bstylesheet\b/i)))) {

			// if the attribute change affected the src attributes we want to know that
			// as that means we need to fetch a new Resource from the server
			// We don't look at currentSrc here because that isn't set until after the resource fetch has started,
			// which will be after the MO observer completes.
			if (node._bmr && typeof node._bmr.res === "number" && node._bmr.end[node._bmr.res]) {
				exisitingNodeSrcUrlChanged = true;
			}

			// we put xlink:href before href because node.href works for <SVG:IMAGE> elements,
			// but does not return a string
			url = node.src ||
				(typeof node.getAttribute === "function" && node.getAttribute("xlink:href")) ||
				node.href;

			// no URL or javascript: or about: or data: URL, so no network activity
			if (!url || url.match(/^(about:|javascript:|data:)/i)) {
				return false;
			}

			// we get called from src/href attribute changes but also from nodes being added
			// which may or may not have been seen here before.
			// Check that if we've seen this node before, that the src/href in this case is
			// different which means we need to fetch a new Resource from the server
			if (node._bmr && node._bmr.url !== url) {
				exisitingNodeSrcUrlChanged = true;
			}

			if (node.nodeName === "IMG") {
				if (node.naturalWidth && !exisitingNodeSrcUrlChanged) {
					// img already loaded
					return false;
				}
				else if (typeof node.getAttribute === "function" && node.getAttribute("src") === "") {
					// placeholder IMG
					return false;
				}
			}

			// IFRAMEs whose SRC has changed will not fire a load event again
			if (node.nodeName === "IFRAME" && exisitingNodeSrcUrlChanged) {
				return false;
			}

			//
			// Don't track pixels: <= 1px, display:none or visibility:hidden.
			// Only use attributes, not computed styles, to avoid forcing layout
			//

			// First try to get the number of pixels from width or height attributes
			if (typeof node.getAttribute === "function") {
				domHeight = parseInt(node.getAttribute("height"), 10);
				domWidth = parseInt(node.getAttribute("width"), 10);
			}

			// If not specified, we can look at the style height/width.  We can
			// only be confident about "0", "0px" or "1px" that it's small -- things
			// like "0em" or "0in" would be relative.  Some things that are actually
			// small might not match this list, but it's safer to only check against
			// a known list.
			if (isNaN(domHeight)) {
				domHeight = (node.style &&
				   (node.style.height === "0" ||
					node.style.height === "0px" ||
					node.style.height === "1px")) ? 0 : undefined;
			}

			if (isNaN(domWidth)) {
				domWidth = (node.style &&
				   (node.style.width === "0" ||
					node.style.width === "0px" ||
					node.style.width === "1px")) ? 0 : undefined;
			}

			if (!isNaN(domHeight) && domHeight <= 1 && !isNaN(domWidth) && domWidth <= 1) {
				return false;
			}

			// Check against display:none
			if (node.style && node.style.display === "none") {
				return false;
			}

			// Check against visibility:hidden
			if (node.style && node.style.visibility === "hidden") {
				return false;
			}

			current_event = this.pending_events[index];

			if (!current_event) {
				return false;
			}

			// determine the resource number for this request
			resourceNum = current_event.resources.length;

			// create a placeholder ._bmr attribute
			if (!node._bmr) {
				node._bmr = {
					end: {}
				};
			}

			// keep track of all resources (URLs) seen for the root resource
			if (!current_event.urls) {
				current_event.urls = {};
			}

			if (current_event.urls[url]) {
				// we've already seen this URL, no point in waiting on it twice
				return false;
			}

			// if we don't have a URL yet (i.e. a click started this), use
			// this element's URL
			if (!current_event.resource.url) {
				a.href = url;

				if (impl.excludeFilter(a)) {

					// excluded resource, so abort
					return false;
				}

				current_event.resource.url = a.href;
			}

			// update _bmr with details about this resource
			node._bmr.res = resourceNum;
			node._bmr.idx = index;
			delete node._bmr.end[resourceNum];
			node._bmr.url = url;

			listener = function(ev) {
				self.load_cb(ev, resourceNum);
				// if either event fires then cleanup both listeners
				node.removeEventListener("load", listener);
				node.removeEventListener("error", listener);
			};

			node.addEventListener("load", listener);
			node.addEventListener("error", listener);

			// increase the number of outstanding resources by one
			current_event.nodes_to_wait++;

			// ensure the timeout is cleared
			this.clearTimeout(index);

			// increase the number of total resources by one
			current_event.total_nodes++;

			current_event.resources.push(node);

			// Note that we're tracking this URL
			current_event.urls[url] = 1;

			interesting = true;
		}
		// if it's an Element node such as <p> or <div>, find all the images contained in it
		else if (node.nodeType === Node.ELEMENT_NODE) {
			["IMAGE", "IMG"].forEach(function(tagName) {
				els = node.getElementsByTagName(tagName);
				if (els && els.length) {
					for (i = 0, l = els.length; i < l; i++) {
						interesting |= this.wait_for_node(els[i], index);
					}
				}
			}, this);
		}

		return interesting;
	};

	/**
	 * Adds a resource to the current event.
	 *
	 * Might fail (return -1) if:
	 * a) There are no pending events
	 * b) The current event is complete
	 * c) There's no passed-in resource
	 *
	 * @param resource Resource
	 *
	 * @return Event index, or -1 on failure
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.add_event_resource = function(resource) {
		var index = this.pending_events.length - 1, current_event;
		if (index < 0) {
			return -1;
		}

		current_event = this.pending_events[index];
		if (!current_event) {
			return -1;
		}

		if (!resource) {
			return -1;
		}



		// increase the number of outstanding resources by one
		current_event.nodes_to_wait++;
		// increase the number of total resources by one
		current_event.total_nodes++;

		resource.index = index;
		resource.node = true;  // this resource is a node being tracked by an existing pending event

		return index;
	};

	/**
	 * Callback called once [Mutation Observer instance]{@link MutationObserver#observer}
	 * noticed a mutation on the page. This method will determine if a mutation on
	 * the page is interesting or not.
	 *
	 * @callback mutation_cb
	 * @param {Mutation[]} mutations - Mutation array describing changes to the DOM
	 *
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.mutation_cb = function(mutations) {
		var self, index, evt;

		if (!this.watch) {
			return true;
		}

		self = this;
		index = this.pending_events.length - 1;

		if (index < 0 || !this.pending_events[index]) {
			// Nothing waiting for mutations
			return true;
		}

		evt = this.pending_events[index];

		// for xhr events, only track mutations if at least one of the tracked xhr nodes has
		// had a response
		if (evt.ignoreMO) {
			return true;
		}

		if (typeof evt.interesting === "undefined") {
			evt.interesting = false;
		}

		if (mutations && mutations.length) {
			evt.resource.timing.domComplete = BOOMR.now();

			mutations.forEach(function(mutation) {
				var i, l, node;
				if (mutation.type === "attributes") {
					evt.interesting |= self.wait_for_node(mutation.target, index);
				}
				else if (mutation.type === "childList") {
					// Go through any new nodes and see if we should wait for them
					l = mutation.addedNodes.length;
					for (i = 0; i < l; i++) {
						evt.interesting |= self.wait_for_node(mutation.addedNodes[i], index);
					}

					// Go through any removed nodes, and for IFRAMEs, see if we were
					// waiting for them.  If so, stop waiting, as removed IFRAMEs
					// don't trigger load or error events.
					l = mutation.removedNodes.length;
					for (i = 0; i < l; i++) {
						node = mutation.removedNodes[i];
						if (node.nodeName === "IFRAME" && node._bmr) {
							self.load_cb({target: node, type: "removed"});
						}
					}
				}
			});
		}

		if (!evt.interesting && !evt.timeoutExtended) {
			// timeout the event if we haven't already created a timer and
			// we didn't have any interesting nodes for this MO callback or
			// any prior callbacks
			this.setTimeout(UNINTERESTING_MUTATION_TIMEOUT, index);

			// only extend the timeout for an interesting thing to happen once
			evt.timeoutExtended = true;
		}

		return true;
	};

	/**
	 * Determines if the resources queue is empty
	 *
	 * @return {boolean} True if there are no outstanding resources
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.queue_is_empty = function() {
		return this.nodesWaitingFor() === 0;
	};

	/**
	 * Determines how many nodes are being waited on
	 * @param {number} [index] Optional Event index, defaults to last event
	 *
	 * @return {number} Number of nodes being waited on
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.nodesWaitingFor = function(index) {
		var ev;

		if (this.pending_events.length === 0) {
			return 0;
		}

		if (typeof index === "undefined") {
			index = this.pending_events.length - 1;
		}

		ev = this.pending_events[index];
		if (!ev) {
			return 0;
		}

		return ev.nodes_to_wait;
	};

	/**
	 * Completes the current event, marking the end time as 'now'.
	 * @param {number} [index] Optional Event index, defaults to last event
	 *
	 * @method
	 * @memberof MutationHandler
	 */
	MutationHandler.prototype.completeEvent = function(index) {
		var now = BOOMR.now(), ev;

		if (this.pending_events.length === 0) {
			// no active events
			return;
		}

		if (typeof index === "undefined") {
			index = this.pending_events.length - 1;
		}

		ev = this.pending_events[index];
		if (!ev) {
			// unknown event
			return;
		}

		// set the end timestamp to now
		ev.resource.timing.loadEventEnd = now;

		// note that this end was forced
		ev.forced = true;

		// complete this event
		this.sendEvent(index);
	};

	handler = new MutationHandler();

	/**
	 * Subscribe to click events on the page and see if they are triggering new
	 * resources fetched from the network in which case they are interesting
	 * to us!
	 */
	function instrumentClick() {
		// Capture clicks and wait 50ms to see if they result in DOM mutations
		BOOMR.subscribe("click", function() {
			if (impl.singlePageApp) {
				// In a SPA scenario, only route changes (or events from the SPA
				// framework) trigger an interesting event.
				return;
			}

			var resource = { timing: {}, initiator: "click" };

			if (!BOOMR.orig_XMLHttpRequest ||
			    BOOMR.orig_XMLHttpRequest === w.XMLHttpRequest) {
				// do nothing if we have un-instrumented XHR
				return;
			}

			resource.timing.requestStart = BOOMR.now();
			handler.addEvent(resource);
		});
	}

	/**
	 * Determines whether or not the specified url matches the
	 * {@link BOOMR.plugins.AutoXHR.init|alwaysSendXhr} list.
	 *
	 * `alwaysSendXhr` can be:
	 * * a `boolean`, if `true` meaning every XHR will send a beacon
	 * * a `function` which returns `true` for XHRs that should send a beacon
	 * * an array of `strings` or regular expressions which match to XHRs
	 *   that should send a beacon
	 *
	 * @param {string} url URL to match
	 * @param {string[]|RegExp[]|function|boolean} alwaysSendXhr Configuration
	 *
	 * @returns {boolean} True if the URL should always send a beacon
	 */
	function matchesAlwaysSendXhr(url, alwaysSendXhr) {
		var i, rule;

		if (!alwaysSendXhr || !url) {
			return false;
		}

		// alwaysSendXhr is a boolean
		if (typeof alwaysSendXhr === "boolean") {
			return alwaysSendXhr === true;
		}

		// alwaysSendXhr is a function
		if (typeof alwaysSendXhr === "function") {
			try {
				return alwaysSendXhr(url) === true;
			}
			catch (e) {
				return false;
			}
		}

		// alwaysSendXhr is a list of strings or regular expressions
		if (BOOMR.utils.isArray(alwaysSendXhr)) {
			for (i = 0; i < alwaysSendXhr.length; i++) {
				rule = alwaysSendXhr[i];

				if (typeof rule === "string" && rule === url) {
					return true;
				}
				else if (rule instanceof RegExp) {
					if (rule.test(url)) {
						return true;
					}
				}
			}
		}

		return false;
	}

	/**
	 * Replace original window.fetch with our implementation instrumenting
	 * any fetch requests happening afterwards
	 */
	function instrumentFetch() {
		if (!impl.monitorFetch ||
		    // we don't check that fetch is a native function in case it was already wrapped
		    // by another vendor
		    typeof w.fetch !== "function" ||
		    // native fetch support will define these, some polyfills like `unfetch` will not
		    typeof w.Request !== "function" ||
		    typeof w.Response !== "function" ||
		    // native fetch needs Promise support
		    typeof w.Promise !== "function" ||
		    // if our window doesn't have fetch then it was probably polyfilled in the top window
		    typeof window.fetch !== "function" ||
		    // Github's `whatwg-fetch` polyfill sets this flag
		    w.fetch.polyfill) {
			return;
		}

		if (BOOMR.proxy_fetch &&
		    BOOMR.proxy_fetch === w.fetch) {
			// already instrumented
			return;
		}

		if (BOOMR.proxy_fetch &&
		    BOOMR.orig_fetch &&
		    BOOMR.orig_fetch === w.fetch) {

			// was once instrumented and then uninstrumented, so just reapply the old instrumented object
			w.fetch = BOOMR.proxy_fetch;

			return;
		}

		// if there's a orig_fetch on the window, use that first (if another lib is overwriting fetch)
		BOOMR.orig_fetch = w.orig_fetch || w.fetch;

		BOOMR.proxy_fetch = function(input, init) {
			var url, method, payload,
			    // we want to keep initiator type as `xhr` for backwards compatibility.
			    // We'll differentiate fetch by `http.type=f` beacon param
			    resource = { timing: {}, initiator: "xhr" };

			// case where fetch() is called with a Request object
			if (typeof input === "object" && input instanceof w.Request) {
				url = input.url;

				// init overrides input
				method = (init && init.method) || input.method || "GET";
				if (impl.captureXhrRequestResponse) {
					payload = (init && init.body) || input.body || undefined;
				}
			}
			// case where fetch() is called with a string url (or anything else)
			else {
				url = input;
				method = (init && init.method) || "GET";
				if (impl.captureXhrRequestResponse) {
					payload = (init && init.body) || undefined;
				}
			}

			a.href = url;
			if (impl.excludeFilter(a)) {
				// this fetch should be excluded from instrumentation

				// call the original open method
				return BOOMR.orig_fetch.apply(w, arguments);
			}
			BOOMR.fireEvent("xhr_init", "fetch");

			resource.url = a.href;
			resource.method = method;
			resource.type = "fetch";  // pending event type will still be "xhr"
			if (payload) {
				resource.requestPayload = payload;
			}

			BOOMR.fireEvent("xhr_send", {resource: resource});

			handler.addEvent(resource);

			try {
				resource.timing.requestStart = BOOMR.now();
				var promise = BOOMR.orig_fetch.apply(this, arguments);

				/**
				 * wraps a onFulfilled or onRejection function that is passed to
				 * a promise's `.then` method. Will attempt to detect when there
				 * are no other promises in the chain that need to be executed and
				 * then mark the resource as finished. For simplicity, we only track
				 * the first `.then` call of each promise.
				 *
				 * @param {Promise} Promise that the callback is attached to
				 * @param {function} onFulfilled or onRejection callback function
				 * @param {Object} Fetch resource that we're handling in this promise
				 *
				 * @returns {function} Wrapped callback function
				 */
				function wrapCallback(_promise, _fn, _resource) {
					function done() {
						var now;
						// check if the response body was used, if not then we'll
						// wait a little bit longer. Hopefully it is a short response
						// (posibly only containing headers and status) and the entry
						// will be available in RT if we wait.
						// We don't detect if the response was consumed from a cloned object
						if (_resource.fetchResponse && !_resource.fetchResponse.bodyUsed && impl.fetchBodyUsedWait) {
							now = BOOMR.now();
							_resource.responseBodyNotUsed = true;
							setTimeout(function() {
								impl.loadFinished(_resource, now);
							}, impl.fetchBodyUsedWait);
						}
						else {
							impl.loadFinished(_resource);
						}
					}

					/**
					 * @returns {Promise} Promise result of callback or rethrows exception from callback
					 */
					return function() {
						var p, np = _promise._bmrNextP;
						try {
							p = _fn.apply((this === window ? w : this), arguments);

							// no exception thrown, check if there's a onFulfilled
							// callback in the chain
							while (np && !np._bmrHasOnFulfilled) {
								np = np._bmrNextP;  // next promise in the chain
							}
							if (!np) {
								// we didn't find one, if the callback result is a promise
								// then we'll wait for it to complete, if not mark this
								// resource as finished now
								if (p instanceof w.Promise) {
									p.then = wrapThen(p, p.then, _resource);
								}
								else {
									done();
								}
							}
							return p;
						}
						catch (e) {
							// exception thrown, check if there's a onRejected
							// callback in the chain
							while (np && !np._bmrHasOnRejected) {
								np = np._bmrNextP;  // next promise in the chain
							}
							if (!np) {
								// we didn't find one, mark the resource as complete
								done();
							}
							throw e;  // rethrow exception
						}
					};
				};

				/**
				 * wraps `.then` so that we can in turn wrap onFulfilled or onRejection that
				 * are passed to it. Wrapping `.then` will also trap calls from `.catch` and `.finally`
				 *
				 * @param {Promise} Promise that we're wrapping `.then` method for
				 * @param {function} `.then` function that will be wrapped
				 * @param {Object} Fetch resource that we're handling in this promise
				 *
				 * @returns {function} Wrapped `.then` function or original `.then` function
				 * if `.then` was already called on this promise
				 */
				function wrapThen(_promise, _then, _resource) {
					// only track the first `.then` call
					if (_promise._bmrNextP) {
						return _then;  // return unwrapped `.then`
					}
					/**
					 * @returns {Promise} Result of `.then` call
					 */
					return function(/* onFulfilled, onRejection */) {
						var args = Array.prototype.slice.call(arguments);
						if (args.length > 0) {
							if (typeof args[0] === "function") {
								args[0] = wrapCallback(_promise, args[0], _resource);
								_promise._bmrHasOnFulfilled = true;
							}
							if (args.length > 1) {
								if (typeof args[1] === "function") {
									args[1] = wrapCallback(_promise, args[1], _resource);
									_promise._bmrHasOnRejected = true;
								}
							}
						}
						var p = _then.apply(_promise, args);
						_promise._bmrNextP = p; // next promise in the chain
						// p should always be a Promise
						p.then = wrapThen(p, p.then, _resource);
						return p;
					};
				};

				// we can't just wrap functions that read the response (e.g.`.text`, `json`, etc.) or
				// instrument `.body.getReader`'s stream because they might never be called.
				// We'll wrap `.then` and all the callback handlers to figure out which
				// is the last handler to execute. Once the last handler runs, we'll mark the resource
				// as finished. For simplicity, we only track the first `.then` call of each promise
				promise.then = wrapThen(promise, promise.then, resource);

				return promise.then(function(response) {
					var i, res, ct, parseJson = false, parseXML = false;

					if (response.status < 200 || response.status >= 400) {
						// put the HTTP error code on the resource if it's not a success
						resource.status = response.status;
					}

					resource.fetchResponse = response;

					if (resource.index >= 0) {
						// response is starting to come in, we'll start monitoring for
						// DOM mutations
						handler.monitorMO(resource.index);
					}

					if (impl.captureXhrRequestResponse) {
						// clone not supported in Safari yet
						if (typeof response.clone === "function") {
							// content-type detection to determine if we should parse json or xml
							ct = response.headers.get("content-type");
							if (ct) {
								parseJson = ct.indexOf("json") !== -1;
								parseXML = ct.indexOf("xml") !== -1;
							}

							resource.response = {};
							try {
								res = response.clone();
								res.text().then(function(text) {
									resource.response.text = text;
									resource.response.raw = text;  // for fetch, we'll set raw to text value
									if (parseXML && typeof w.DOMParser === "function") {
										resource.response.xml = (new w.DOMParser()).parseFromString(text, "text/xml");
									}
								}).then(null, function(reason) {  // `.catch` will cause parse errors in old browsers
									// empty (avoid unhandled rejection)
								});
							}
							catch (e) {
								// empty
							}

							if (parseJson) {
								try {
									res = response.clone();
									res.json().then(function(json) {
										resource.response.json = json;
									}).then(null, function(reason) {  // `.catch` will cause parse errors in old browsers
										// empty (avoid unhandled rejection)
									});
								}
								catch (e) {
									// empty
								}
							}
						}
					}
					return response;
				}, function(reason) {
					// fetch() request failed (eg. cross-origin error, aborted, connection dropped, etc.)
					// we'll let the `.then` wrapper call finished for this resource

					// check if the fetch was aborted otherwise mark it as an error
					if (reason && (reason.name === "AbortError" || reason.code === 20)) {
						resource.status = XHR_STATUS_ABORT;
					}
					else {
						resource.status = XHR_STATUS_ERROR;
					}

					// rethrow the native method's exception
					throw reason;
				});
			}
			catch (e) {
				// there was an exception during fetch()
				resource.status = XHR_STATUS_OPEN_EXCEPTION;
				impl.loadFinished(resource);

				// rethrow the native method's exception
				throw e;
			}
		};

		// Overwrite window.fetch, ensuring the original is swapped back in
		// if the Boomerang IFRAME is unloaded.  uninstrumentFetch() may also
		// be used to swap the original back in.
		BOOMR.utils.overwriteNative(w, "fetch", BOOMR.proxy_fetch);
	}

	/**
	 * Put original fetch function back into place
	 */
	function uninstrumentFetch() {
		if (typeof w.fetch === "function" &&
		    BOOMR.orig_fetch && BOOMR.orig_fetch !== w.fetch) {
			w.fetch = BOOMR.orig_fetch;
		}
	}

	/**
	 * Replace original window.XMLHttpRequest with our implementation instrumenting
	 * any AJAX Requests happening afterwards. This will also enable instrumentation
	 * of mouse events (clicks) and start the {@link MutationHandler}
	 */
	function instrumentXHR() {
		if (BOOMR.proxy_XMLHttpRequest &&
			BOOMR.proxy_XMLHttpRequest === w.XMLHttpRequest) {
			// already instrumented
			return;
		}

		if (BOOMR.proxy_XMLHttpRequest &&
			BOOMR.orig_XMLHttpRequest &&
			BOOMR.orig_XMLHttpRequest === w.XMLHttpRequest) {
			// was once instrumented and then uninstrumented, so just reapply the old instrumented object

			w.XMLHttpRequest = BOOMR.proxy_XMLHttpRequest;
			MutationHandler.start();

			return;
		}

		// if there's a orig_XMLHttpRequest on the window, use that first (if another lib is overwriting XHR)
		BOOMR.orig_XMLHttpRequest = w.orig_XMLHttpRequest || w.XMLHttpRequest;

		MutationHandler.start();

		instrumentClick();

		/**
		 * Proxy `XMLHttpRequest` object
		 * @class ProxyXHRImplementation
		 */

		/**
		 * Open an XMLHttpRequest.
		 * If the URL passed as a second argument is in the BOOMR.xhr_exclude list ignore it and move on to request it
		 * Otherwise add it to our list of resources to monitor and later beacon on.
		 *
		 * If an exception is caught will call loadFinished and set resource.status to {@link XHR_STATUS_OPEN_EXCEPTION}
		 * Should the resource fail to load for any of the following reasons resource.stat status code will be set to:
		 *
		 * - timeout {Event} {@link XHR_STATUS_TIMEOUT}
		 * - error {Event} {@link XHR_STATUS_ERROR}
		 * - abort {Event} {@link XHR_STATUS_ABORT}
		 *
		 * @param {string} method HTTP request method
		 * @param {string} url URL to request on
		 * @param {boolean} [async] If `true` will setup the EventListeners for XHR events otherwise will set the resource
		 * to synchronous. If `true` or `undefined` will be automatically set to asynchronous
		 *
		 * @memberof ProxyXHRImplementation
		 */
		BOOMR.proxy_XMLHttpRequest = function() {
			var req, resource = { timing: {}, initiator: "xhr" }, orig_open, orig_send,
			    opened = false, excluded = false;

			req = new BOOMR.orig_XMLHttpRequest();

			orig_open = req.open;
			orig_send = req.send;

			req.open = function(method, url, async) {
				a.href = url;
        req.tunaRequestUrl = url;

				if (impl.excludeFilter(a)) {
					// this xhr should be excluded from instrumentation
					excluded = true;

					// call the original open method
					return orig_open.apply(req, arguments);
				}
				excluded = false;

				// Default value of async is true
				if (async === undefined) {
					async = true;
				}

				BOOMR.fireEvent("xhr_init", "xhr");

				/**
				 * Setup an {EventListener} for Event @param{ename}. This function will
				 * make sure the timestamp for the resources request is set and calls
				 * loadFinished should the resource have finished.
				 *
				 * See {@link open()} for it's usage
				 *
				 * @param ename {String} Eventname to listen on via addEventListener
				 * @param stat {String} if that {@link ename} is reached set this
				 * as the status of the resource
				 *
				 * @memberof ProxyXHRImplementation
				 */
				function addListener(ename, stat) {
					req.addEventListener(
						ename,
						function() {
							if (ename === "readystatechange") {
								resource.timing[readyStateMap[req.readyState]] = BOOMR.now();

								// Listen here as well, as DOM changes might happen on other listeners
								// of readyState = 4 (complete), and we want to make sure we've
								// started the addEvent() if so.  Only listen if the status is non-zero,
								// meaning the request wasn't aborted.  Aborted requests will fire the
								// next handler.
								if (req.readyState === 4 && req.status !== 0) {
									if (req.status < 200 || req.status >= 400) {
										// put the HTTP error code on the resource if it's not a success
										resource.status = req.status;
									}

									if (impl.captureXhrRequestResponse) {
										resource.response = {
											text: (req.responseType === "" || req.responseType === "text") ? req.responseText : null,
											xml: (req.responseType === "" || req.responseType === "document") ? req.responseXML : null,
											raw: req.response,
											json: req.responseJSON
										};

										//
										// Work around browser bugs where our Boomerang frame's Object is not equal
										// to the main frame's Object.  This affects "isPlainObj()"-like checks that
										// validate the .constructor is equal to the main frame's Object.
										// e.g.
										// https://github.com/facebook/immutable-js/blob/master/src/utils/isPlainObj.js
										// This seems to mostly affect Safari 11.1.
										//
										if (req.response &&
										    req.response.constructor &&
										    req.response.constructor === BOOMR.boomerang_frame.Object &&
										    BOOMR.boomerang_frame.Object !== w.Object) {
											try {
												// try to switch the constructor to the main window
												req.response.constructor = w.Object;
											}
											catch (e) {
												// NOP
											}
										}
									}

									BOOMR.plugins.xhrWatcher.pushHeader( req, impl );

									impl.loadFinished(resource);
								}
								else if (req.readyState === 0 && typeof resource.timing.open === "number") {
									// something called .abort() after the request was started
									resource.status = XHR_STATUS_ABORT;
									impl.loadFinished(resource);
								}
							}
							else {
								// load, timeout, error, abort
								if (ename === "load") {
									if (req.status < 200 || req.status >= 400) {
										// put the HTTP error code on the resource if it's not a success
										resource.status = req.status;
									}
								}
								else {
									// this is a timeout/error/abort, so add the status code
									resource.status = (stat === undefined ? req.status : stat);
								}

								impl.loadFinished(resource);
							}
						},
						false
					);
				}

				// .open() can be called multiple times (before .send()) - just make
				// sure that we don't track this as a new request, or add additional
				// event listeners
				if (!opened) {
					if (async) {
						addListener("readystatechange");
					}

					addListener("load");
					addListener("timeout", XHR_STATUS_TIMEOUT);
					addListener("error",   XHR_STATUS_ERROR);
					addListener("abort",   XHR_STATUS_ABORT);
				}

				resource.url = a.href;
				resource.method = method;
				resource.type = "xhr";

				// reset any statuses from previous calls to .open()
				delete resource.status;

				if (!async) {
					resource.synchronous = true;
				}

				// note we've called .open
				opened = true;

				// call the original open method
				try {
					return orig_open.apply(req, arguments);
				}
				catch (e) {
					// if there was an exception during .open(), .send() won't work either,
					// so let's fire loadFinished now
					resource.status = XHR_STATUS_OPEN_EXCEPTION;
					impl.loadFinished(resource);

					// rethrow the native method's exception
					throw e;
				}
			};

			/**
			 * Mark requestStart timestamp and start the request unless the resource
			 * has already been marked as having an error code or a result to itself.
			 *
			 * @returns {Object} The data normal XHR.send() would return
			 *
			 * @memberof ProxyXHRImplementation
			 */
			req.send = function(data) {
				if (excluded) {
					// this xhr is excluded from instrumentation, call the original send method
					return orig_send.apply(req, arguments);
				}

				if (impl.captureXhrRequestResponse) {
					req.resource.requestPayload = data;
				}

				BOOMR.fireEvent("xhr_send", req);

				handler.addEvent(resource);

				resource.timing.requestStart = BOOMR.now();
				// call the original send method unless there was an error
				// during .open
				if (typeof resource.status === "undefined" ||
				    resource.status !== XHR_STATUS_OPEN_EXCEPTION) {
					return orig_send.apply(req, arguments);
				}

			};

			req.resource = resource;

			return req;
		};

		BOOMR.proxy_XMLHttpRequest.UNSENT = 0;
		BOOMR.proxy_XMLHttpRequest.OPENED = 1;
		BOOMR.proxy_XMLHttpRequest.HEADERS_RECEIVED = 2;
		BOOMR.proxy_XMLHttpRequest.LOADING = 3;
		BOOMR.proxy_XMLHttpRequest.DONE = 4;
		// set our proxy's prototype to the original XHR prototype, in case anyone
		// is using it to save state
		BOOMR.proxy_XMLHttpRequest.prototype = BOOMR.orig_XMLHttpRequest.prototype;

		// Overwrite window.XMLHttpRequest, ensuring the original is swapped back in
		// if the Boomerang IFRAME is unloaded.  uninstrumentXHR() may also
		// be used to swap the original back in.
		BOOMR.utils.overwriteNative(w, "XMLHttpRequest", BOOMR.proxy_XMLHttpRequest);
	}

	/**
	 * Put original XMLHttpRequest Configuration back into place
	 */
	function uninstrumentXHR() {
		if (BOOMR.orig_XMLHttpRequest && BOOMR.orig_XMLHttpRequest !== w.XMLHttpRequest) {
			w.XMLHttpRequest = BOOMR.orig_XMLHttpRequest;
		}
	}

	/**
	 * Sends an XHR resource
	 */
	function sendResource(resource) {
		resource.initiator = "xhr";

		BOOMR.responseEnd(resource);
	}

	/**
	 * Container for AutoXHR plugin Closure specific state configuration data
	 *
	 * @property {string[]} spaBackendResources Default resources to count as Back-End during a SPA nav
	 * @property {FilterObject[]} filters Array of {@link FilterObject} that is used to apply filters on XHR Requests
	 * @property {boolean} initialized Set to true after the first run of
	 * @property {string[]} addedVars Vars added to the next beacon only
	 * {@link BOOMR.plugins.AutoXHR#init}
	 */
	impl = {
		spaBackEndResources: SPA_RESOURCES_BACK_END,
		alwaysSendXhr: false,
		excludeFilters: [],
		initialized: false,
		addedVars: [],
		captureXhrRequestResponse: false,
		singlePageApp: false,
		autoXhrEnabled: false,
		monitorFetch: false,  // new feature, off by default
		fetchBodyUsedWait: FETCH_BODY_USED_WAIT_DEFAULT,
		spaIdleTimeout: SPA_TIMEOUT,
		xhrIdleTimeout: CLICK_XHR_TIMEOUT,

		/**
		 * Filter function iterating over all available {@link FilterObject}s if
		 * returns true will not instrument an XHR
		 *
		 * @param {HTMLAnchorElement} anchor - HTMLAnchorElement node created with
		 * the XHRs URL as `href` to evaluate by {@link FilterObject}s and passed
		 * to {@link FilterObject#cb} callbacks.
		 *
		 * NOTE: The anchor needs to be created from the host document
		 * (ie. `BOOMR.window.document`) to enable us to resolve relative URLs to
		 * a full valid path and BASE HREF mechanics can take effect.
		 *
		 * @return {boolean} true if the XHR should not be instrumented false if it should be instrumented
		 */
		excludeFilter: function(anchor) {
			var idx, ret, ctx;

			// If anchor is null we just throw it out period
			if (!anchor || !anchor.href) {
				return false;
			}

			for (idx = 0; idx < impl.excludeFilters.length; idx++) {
				if (typeof impl.excludeFilters[idx].cb === "function") {
					ctx = impl.excludeFilters[idx].ctx;
					if (impl.excludeFilters[idx].name) {

					}

					try {
						ret = impl.excludeFilters[idx].cb.call(ctx, anchor);
						if (ret) {

							return true;
						}
					}
					catch (exception) {
						BOOMR.addError(exception, "BOOMR.plugins.AutoXHR.impl.excludeFilter()");
					}
				}
			}
			return false;
		},

		/**
		 * Remove any added variables from this plugin from the beacon and clear internal collection of addedVars
		 */
		clear: function() {
			if (impl.addedVars && impl.addedVars.length > 0) {
				BOOMR.removeVar(impl.addedVars);
				impl.addedVars = [];
			}
		},

		/**
		 * Mark this as the time load ended via resources loadEventEnd property, if this resource has been added
		 * to the {@link MutationHandler} already notify that the resource has finished.
		 * Otherwise add this call to the lise of Events that occured.
		 *
		 * @param {object} resource Resource
		 *
		 * @memberof BOOMR.plugins.AutoXHR
		 */
		loadFinished: function(resource, now) {
			var entry, navSt, useRT = false, entryStartTime, entryResponseEnd, p;

			now = now || BOOMR.now();

			// if we already finished via readystatechange or an error event,
			// don't do work again
			if (resource.timing.loadEventEnd) {
				return;
			}

			// fire an event for anyone listening
			if (resource.status) {
				BOOMR.fireEvent("xhr_error", resource);
			}

			// set the loadEventEnd timestamp to when this callback fired
			resource.timing.loadEventEnd = now;

			p = BOOMR.getPerformance();
			if (p && p.timing) {
				navSt = p.timing.navigationStart;

				// if ResourceTiming is available, fix-up the .timings with ResourceTiming
				// data, as it will be more accurate
				entry = BOOMR.getResourceTiming(resource.url,
					function(rt1, rt2) {
						// sort by desc responseEnd so that we'll get the one that finished closest to now
						return rt1.responseEnd - rt2.responseEnd;
					},
					function(rt) {
						// filter out requests that started before our tracked resource.
						// We set `requestStart` right before calling the original xhr.send or fetch call.
						// If the ResourceTiming startTime is more than 2ms earlier
						// than when we thought the XHR/fetch started then this is probably
						// an entry for a different resource.
						// The RT entry's startTime needs to be converted to an Epoch
						return ((Math.ceil(navSt + rt.startTime + 2) >= resource.timing.requestStart)) &&
						    (rt.responseEnd !== 0);
					}
				);

				if (entry) {
					// convert the start time to Epoch
					entryStartTime = Math.floor(navSt + entry.startTime);

					// set responseEnd, convert to Epoch
					entryResponseEnd = Math.floor(navSt + entry.responseEnd);

					// sanity check to see if the entry should be used for this resource
					if (entryResponseEnd <= BOOMR.now()) {  // this check could be moved into the fiter above
						resource.timing.responseEnd = entryResponseEnd;

						// make sure loadEventEnd is greater or equal to the RT
						// entry's responseEnd.
						// This will happen when fetch API is used without consuming the
						// response body
						if (resource.timing.loadEventEnd < entryResponseEnd) {
							resource.timing.loadEventEnd = entryResponseEnd;
						}

						// use the startTime from ResourceTiming instead
						resource.timing.requestStart = entryStartTime;

						// also track it as the fetchStart time
						resource.timing.fetchStart = entryStartTime;

						// use responseStart if it's valid
						if (entry.responseStart !== 0) {
							resource.timing.responseStart = Math.floor(navSt + entry.responseStart);
						}

						// save the entry for later use
						resource.restiming = entry;
					}
				}
			}

			// if there's an active XHR event happening, and alwaysSendXhr is true, make sure this
			// XHR goes out on its own beacon too
			if (resource.node && matchesAlwaysSendXhr(resource.url, impl.alwaysSendXhr)) {
				handler.sendResource(resource);
			}

			if (resource.index >= 0) {
				handler.monitorMO(resource.index);

				// fire the load_finished handler for the corresponding event.
				handler.load_finished(resource.index, resource.timing.responseEnd);
			}
		}
	};

	BOOMR.plugins.AutoXHR = {
		/**
		 * This plugin is always complete (ready to send a beacon)
		 *
		 * @returns {boolean} `true`
		 * @memberof BOOMR.plugins.AutoXHR
		 */
		is_complete: function() {
			return true;
		},

		/**
		 * Initializes the plugin.
		 *
		 * @param {object} config Configuration
		 * @param {boolean} [config.instrument_xhr] Whether or not to instrument XHR
		 * @param {string[]} [config.AutoXHR.spaBackEndResources] Default resources to count as
		 * Back-End during a SPA nav
		 * @param {boolean} [config.AutoXHR.monitorFetch] Whether or not to instrument fetch()
		 * @param {number} [config.AuthXHR.fetchBodyUsedWait] If the fetch response's bodyUsed flag is false,
		 * we'll wait this amount of ms before checking RT for an entry. Setting to 0 will disable this feature
		 * @param {boolean} [config.AutoXHR.alwaysSendXhr] Whether or not to send XHR
		 * beacons for every XHR.
		 * @param {boolean} [config.captureXhrRequestResponse] Whether or not to capture an XHR's
		 * request and response bodies on for the {@link event:BOOMR#xhr_load xhr_load} event.
		 *
		 * @returns {@link BOOMR.plugins.AutoXHR} The AutoXHR plugin for chaining
		 * @memberof BOOMR.plugins.AutoXHR
		 */
		init: function(config) {
			var i, idx;

			d = w.document;

			// if we don't have window, abort
			if (!w || !d) {
				return;
			}

			a = d.createElement("A");

			// gather config and config overrides
			BOOMR.utils.pluginConfig(impl, config, "AutoXHR",
			    ["spaBackEndResources", "alwaysSendXhr", "monitorFetch", "fetchBodyUsedWait",
			    "spaIdleTimeout", "xhrIdleTimeout"]);

			BOOMR.instrumentXHR = instrumentXHR;
			BOOMR.uninstrumentXHR = uninstrumentXHR;
			BOOMR.instrumentFetch = instrumentFetch;
			BOOMR.uninstrumentFetch = uninstrumentFetch;

			// Ensure we're only once adding the shouldExcludeXhr
			if (!impl.initialized) {
				this.addExcludeFilter(shouldExcludeXhr, null, "shouldExcludeXhr");

				impl.initialized = true;
			}

			// Add filters from config
			if (config && config.AutoXHR && config.AutoXHR.excludeFilters && config.AutoXHR.excludeFilters.length > 0) {
				for (idx = 0; idx < config.AutoXHR.excludeFilters.length; idx++) {
					impl.excludeFilters.push(config.AutoXHR.excludeFilters[idx]);
				}
			}

			impl.autoXhrEnabled = config.instrument_xhr;

			// check to see if any of the SPAs were enabled
			if (BOOMR.plugins.SPA && BOOMR.plugins.SPA.supported_frameworks) {
				var supported = BOOMR.plugins.SPA.supported_frameworks();
				for (i = 0; i < supported.length; i++) {
					var spa = supported[i];
					if (config[spa] && config[spa].enabled) {
						impl.singlePageApp = true;
						break;
					}
				}
			}

			// Whether or not to always send XHRs.  If a SPA is enabled, this means it will
			// send XHRs during the hard and soft navs.  If enabled, it will also disable
			// listening for MutationObserver events after an XHR is complete.
			if (impl.alwaysSendXhr && impl.autoXhrEnabled && BOOMR.xhr && typeof BOOMR.xhr.stop === "function") {
				function sendXhrs(resources) {
					if (resources.length) {
						for (i = 0; i < resources.length; i++) {
							sendResource(resources[i]);
						}
					}
					else {
						// single resource
						sendResource(resources);
					}
				};

				var resources = BOOMR.xhr.stop(sendXhrs);

				if (resources && resources.length) {
					BOOMR.setImmediate(sendXhrs, resources);
				}
			}

			if (impl.singlePageApp) {
				if (!impl.alwaysSendXhr) {
					// Disable auto-xhr until the SPA has fired its first beacon.  The
					// plugin will re-enable after it's ready.
					impl.autoXhrEnabled = false;
				}

				if (impl.autoXhrEnabled) {
					BOOMR.instrumentXHR();
					BOOMR.instrumentFetch();
				}
			}
			else {
				if (impl.autoXhrEnabled) {
					BOOMR.instrumentXHR();
					BOOMR.instrumentFetch();
				}
				else if (impl.autoXhrEnabled === false) {
					BOOMR.uninstrumentXHR();
					BOOMR.uninstrumentFetch();
				}
			}

			BOOMR.registerEvent("xhr_error");

			BOOMR.subscribe("beacon", impl.clear, null, impl);
		},

		/**
		 * Gets the {@link MutationHandler}
		 *
		 * @returns {MutationHandler} Handler
		 * @memberof BOOMR.plugins.AutoXHR
		 */
		getMutationHandler: function() {
			return handler;
		},

		getPathname: getPathName,

		/**
		 * Enables AutoXHR if not already enabled.
		 *
		 * @memberof BOOMR.plugins.AutoXHR
		 */
		enableAutoXhr: function() {
			if (!impl.autoXhrEnabled) {
				BOOMR.instrumentXHR();
				BOOMR.instrumentFetch();
			}

			impl.autoXhrEnabled = true;
		},

		/**
		 * A callback with a HTML element.
		 * @callback htmlElementCallback
		 * @param {HTMLAnchorElement} elem HTML a element
		 * @memberof BOOMR.plugins.AutoXHR
		 */

		/**
		 * Add a filter function to the list of functions to run to validate if an
		 * XHR should be instrumented.
		 *
		 * @example
		 * BOOMR.plugins.AutoXHR.addExcludeFilter(function(anchor) {
		 *   var m = anchor.href.match(/some-page\.html/g);
		 *
		 *   // If matching flag to not instrument
		 *   if (m && m.length > 0) {
		 *     return true;
		 *   }
		 *   return false;
		 * }, null, "exampleFilter");
		 * @param {BOOMR.plugins.AutoXHR.htmlElementCallback} cb Callback to run to validate filtering of an XHR Request
		 * @param {Object} ctx Context to run {@param cb} in
		 * @param {string} [name] Optional name for the filter, called out when running exclude filters for debugging purposes
		 *
		 * @memberof BOOMR.plugins.AutoXHR
		 */
		addExcludeFilter: function(cb, ctx, name) {
			impl.excludeFilters.push({cb: cb, ctx: ctx, name: name});
		},

		/**
		 * Enables or disables XHR request and response capturing for
		 * the {@link event:BOOMR#xhr_load xhr_load} event.
		 *
		 * @param {boolean} enabled Whether or not to enable capturing
		 */
		setXhrRequestResponseCapturing: function(enabled) {
			impl.captureXhrRequestResponse = enabled;
		}

	};

	/**
	 * Hook called once a resource is found to be loaded and timers have been set.
	 * @callback ResourceOnComplete
	 * @memberof BOOMR.plugins.AutoXHR
	 */

	/**
	 * @typedef {Object} Resource
	 * @memberof BOOMR.plugins.AutoXHR
	 *
	 * @desc
	 * Resource objects define properties of a page element or resource monitored by {@link AutoXHR}.
	 *
	 * @property {string} initiator Type of source that initiated the resource to be fetched:
	 * `click`, `xhr` or SPA initiated
	 * @property {string} url Path to the resource fetched from either the HTMLElement or XHR request that triggered it
	 * @property {object} timing Resource timing information gathered from internal timers or ResourceTiming if supported
	 * @property {ResourceTiming} timing Object containing start and end timings of the resource if set
	 * @property {ResourceOnComplete} [onComplete] Called once the resource has been fetched
	 */

	/**
	 * An event on a page instrumented by {@link MutationHandler} and monitored by AutoXHR
	 *
	 * @typedef PendingEvent
	 *
	 * @property {string} type The type of event that we are watching (`xhr`, `click`,
	 *   [SPAs]{@link BOOMR.constants.BEACON_TYPE_SPAS})
	 * @property {number} nodes_to_wait Number of nodes to wait for before event completes
	 * @property {number} total_nodes Total number of resources
	 * @property {Resource} resource The resource this event is attached to
	 * @property {boolean} complete `true` if event completed `false` if not
	 * @property {Resource[]} [resources] multiple resources that are attached to this event
	 *
	 * @memberof BOOMR.plugins.AutoXHR
	 */

	/**
	 * Timestamps for start of a request and end of loading
	 *
	 * @typedef ResourceTiming
	 *
	 * @property {TimeStamp} loadEventEnd Timestamp when the resource arrived in the browser
	 * @property {TimeStamp} requestStart High resolution timestamp when the resource was started to be loaded
	 *
	 * @memberof BOOMR.plugins.AutoXHR
	 */

	/**
	 * Filter object with data on the callback, context and name.
	 *
	 * @typedef FilterObject
	 *
	 * @property {BOOMR.plugins.AutoXHR.htmlElementCallback} cb Callback
	 * @property {Object} ctx Execution context to use when running `cb`
	 * @property {string} [name] Name of the filter used for logging and debugging purposes (This is an entirely optional property)
	 *
	 * @memberof BOOMR.plugins.AutoXHR
	 */
})();

/**
 * Enables Single Page App (SPA) performance monitoring.
 *
 * **Note**: The `SPA` plugin requires the {@link BOOMR.plugins.AutoXHR} plugin
 * to be loaded before `SPA`, and one of the following SPA plugins to work:
 *
 * * {@link BOOMR.plugins.Angular}
 * * {@link BOOMR.plugins.Backbone}
 * * {@link BOOMR.plugins.Ember}
 * * {@link BOOMR.plugins.History} (React and all other SPA support)
 *
 * You also need to disable {@link BOOMR.init|autorun} when enabling SPA support.
 *
 * If you are not using a SPA framework but rely mostly on `XMLHttpRequests` to
 * build your site, you might be able to skip the SPA plugins and just enable
 * the {@link BOOMR.plugins.AutoXHR} plugin to measure your site.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Approach
 *
 * Boomerang monitors Single Page App (SPA) navigations differently than how it
 * monitors navigations on traditional websites.
 *
 * On traditional websites, the browser completes a full navigation for every page.
 * During this navigation, the browser requests the page's HTML, JavaScript,
 * CSS, etc., from the server, and builds the page from these components. Boomerang
 * monitors this entire process.
 *
 * On SPA websites, only the first page that the visitor loads is a full
 * navigation. All subsequent navigations are handled by the SPA framework
 * itself (i.e. AngularJS), where they dynamically pull in the content they
 * need to render the new page. This is done without executing a full navigation
 * from the browser's point of view.
 *
 * Boomerang was designed for traditional websites, where a full navigation
 * occurs on each page load. During the navigation, Boomerang tracks the
 * performance characteristics of the entire page load experience. However, for
 * SPA websites, only the first page triggers a full navigation. Thus, without
 * any additional help, Boomerang will not track any subsequent interactions
 * on SPA websites.
 *
 * To give visibility into SPA website navigations, there are several Boomerang
 * plugins available for SPA frameworks, such as AngularJS, Ember.js and Backbone.js.
 * When these plugins are enabled, Boomerang is able to track all of the SPA
 * navigations beyond the first, initial navigation.
 *
 * To do so, the Boomerang SPA plugins listen for several life cycle events from
 * the framework, such as AngularJS's `$routeChangeStart`. Once it gets notified
 * of these events, the Boomerang SPA plugins start monitoring the page's markup
 * (DOM) for changes. If any of these changes trigger a download, such as a
 * XHR, image, CSS, or JavaScript, then the Boomerang SPA plugins monitor those
 * resources as well. Only once all of these new resources have been fetched do
 * the Boomerang SPA plugins consider the SPA navigation complete.
 *
 * For a further explanation of the challenges of measuring SPAs, see our
 * {@link https://www.slideshare.net/nicjansma/measuring-the-performance-of-single-page-applications|slides}
 * or our {@link https://www.youtube.com/watch?v=CYEYtQPofhQ&t=10s|talk}.
 *
 * ## Hard and Soft Navigations
 *
 * * A **SPA Hard Navigation** is always the first navigation to the site, plus
 *   any of the work required to build the initial view.
 *    * The Hard Navigation will track at least the length of `onload`, but may also include the additional
 *      time required to load the framework (for example, Angular) and the first view.
 *    * A SPA site will only have a single SPA Hard Navigation, no "Page Load" beacons.
 *    * The `http.initiator` type is `spa_hard`
 * * A **SPA Soft Navigation** is any navigation after the Hard Navigation.
 *    * A soft navigation is an "in-page" navigation where the view changes, but
 *      the browser does not actually fully navigate.
 *    * A SPA site could have zero through many Soft Navigations
 *    * The `http.initiator` type is `spa`
 *
 * ## Navigation Timestamps
 *
 * ### Hard Navigations
 *
 * The length of a Hard Navigation is calculated from the beginning of the browser
 * navigation (e.g. `navigationStart` from NavigationTiming) through when the
 * last critical resource has been fetched for the page.
 *
 * Critical resources include Images, IFRAMEs, CSS and Scripts.
 *
 * ### Soft Navigations
 *
 * The length of a Soft Navigation is calculated from the beginning of the route
 * change event (e.g. when the user clicked somewhere to change the view) through
 * when the last critical resource has been fetched for the page.
 *
 * ## Front-End vs. Back-End Time
 *
 * For SPA navigations, the _Back End_ time (`t_resp`) is calculated as any period
 * where a XHR or Script tag was being fetched.
 *
 * The _Front End_ time (`t_page`) is calculated by taking the total SPA Page
 * Load time (`t_done`) minus _Back End_ time (`t_resp`).
 *
 * ## Beacon Parameters
 *
 * * `http.initiator`
 *     * `spa_hard` for Hard Navigations
 *     * `spa` for Soft Navigations
 *
 * @class BOOMR.plugins.SPA
 */
(function() {
	var hooked = false,
	    initialized = false,
	    initialRouteChangeStarted = false,
	    initialRouteChangeCompleted = false,
	    autoXhrEnabled = false,
	    firstSpaNav = true,
	    routeFilter = false,
	    routeChangeWaitFilter = false,
	    disableHardNav = false,
	    supported = [],
	    latestResource,
	    waitingOnHardMissedComplete = false;




	if (BOOMR.plugins.SPA || !BOOMR.plugins.AutoXHR) {
		return;
	}


	var impl = {
		/**
		 * Called after a SPA Hard navigation that missed the route change
		 * completes.
		 *
		 * We may want to fix-up the timings of the SPA navigation if there was
		 * any other activity after onload.
		 *
		 * If there was not activity after onload, using the timings for
		 * onload from NavigationTiming.
		 *
		 * If there was activity after onload, use the end time of the latest
		 * resource.
		 *
		 * @param {BOOMR.plugins.AutoXHR.Resource} resource Resource
		 */
		spaHardMissedOnComplete: function(resource) {
			var p, navigationStart = (BOOMR.plugins.RT && BOOMR.plugins.RT.navigationStart());

			waitingOnHardMissedComplete = false;

			// note that we missed the route change on the beacon for debugging
			BOOMR.addVar("spa.missed", "1");

			// ensure t_done is the time we've specified
			if (BOOMR.plugins.RT) {
				BOOMR.plugins.RT.clearTimer("t_done");
			}

			// always use the start time of navigationStart
			resource.timing.requestStart = navigationStart;

			if (resource.resources.length === 0) {
				// No other resources were fetched, so set the end time
				// to NavigationTiming's performance.loadEventEnd if available (instead of 'now')
				p = BOOMR.getPerformance();
				if (p && p.timing && p.timing.navigationStart && p.timing.loadEventEnd) {
					resource.timing.loadEventEnd = p.timing.loadEventEnd;
				}
			}
		},

		/**
		 * Fired on each beacon.
		 */
		onBeacon: function() {
			// remove all of the potential parameters we added to the beacon
			BOOMR.removeVar("spa.missed", "spa.forced", "spa.waiting");
		}
	};

	//
	// Exports
	//
	BOOMR.plugins.SPA = {
		/**
		 * Determines if the plugin is complete
		 *
		 * @returns {boolean} True if the plugin is complete
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		is_complete: function() {
			return !waitingOnHardMissedComplete;
		},

		/**
		 * Called to initialize the plugin via BOOMR.init()
		 *
		 * @param {object} config Configuration
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		init: function(config) {
			if (config && config.instrument_xhr) {
				autoXhrEnabled = config.instrument_xhr;

				// if AutoXHR is enabled, and we've already had
				// a route change, make sure to turn AutoXHR back on
				if (initialRouteChangeStarted && autoXhrEnabled) {
					BOOMR.plugins.AutoXHR.enableAutoXhr();
				}
			}

			if (initialized) {
				return;
			}

			initialized = true;

			BOOMR.subscribe("beacon", impl.onBeacon, null, impl);
		},

		/**
		 * Registers a framework with the SPA plugin
		 *
		 * @param {string} pluginName Plugin name
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		register: function(pluginName) {
			supported.push(pluginName);
		},

		/**
		 * Gets a list of supported SPA frameworks
		 *
		 * @returns {string[]} List of supported frameworks
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		supported_frameworks: function() {
			return supported;
		},

		/**
		 * Fired when onload happens (or immediately if onload has already fired)
		 * to monitor for additional resources for a SPA Hard navigation
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		onLoadSpaHardMissed: function() {
			if (initialRouteChangeStarted) {
				// we were told the History event was missed, but it happened anyways
				// before onload
				return;
			}

			// We missed the initial route change (we loaded too slowly), so we're too
			// late to monitor for new DOM elements.  Don't hold the initial page load beacon.
			initialRouteChangeCompleted = true;

			if (autoXhrEnabled) {
				// re-enable AutoXHR if it's enabled
				BOOMR.plugins.AutoXHR.enableAutoXhr();
			}

			// ensure the beacon is held until this SPA hard beacon is ready
			waitingOnHardMissedComplete = true;

			if (!disableHardNav) {
				// `this` is unbound, use BOOMR.plugins.SPA
				BOOMR.fireEvent("spa_init", [BOOMR.plugins.SPA.current_spa_nav(), BOOMR.window.document.URL]);
				// Trigger a route change
				BOOMR.plugins.SPA.route_change(impl.spaHardMissedOnComplete);
			}
			else {
				waitingOnHardMissedComplete = false;
			}
		},

		/**
		 * Callback to let the SPA plugin know whether or not to monitor the current
		 * SPA soft route.
		 *
		 * Any time a route is changed, if set, this callback will be executed
		 * with the current framework's route data.
		 *
		 * If the callback returns `false`, the route will not be monitored.
		 *
		 * @callback spaRouteFilter
		 * @param {object} data Route data
		 *
		 * @returns {boolean} `true` to monitor the current route
		 * @memberof BOOMR.plugins.SPA
		 */

		/**
		 * Callback to let the SPA plugin know whether or not the end of monitoring
		 * of the current SPA soft route should be delayed until {@link BOOMR.plugins.SPA.wait_complete}
		 * is called.
		 *
		 * If the callback returns `false`, the route will be monitored as normal.
		 *
		 * @callback spaRouteChangeWaitFilter
		 * @param {object} data Route data
		 *
		 * @returns {boolean} `true` to wait until {@link BOOMR.plugins.SPA.wait_complete} is called.
		 * @memberof BOOMR.plugins.SPA
		 */

		/**
		 * Called by a framework when it has hooked into the target SPA
		 *
		 * @param {boolean} hadRouteChange True if a route change has already fired
		 * @param {object} [options] Additional options
		 * @param {BOOMR.plugins.SPA.spaRouteFilter} [options.routeFilter] Route filter
		 * @param {BOOMR.plugins.SPA.spaRouteChangeWaitFilter} [options.routeChangeWaitFilter] Route change wait filter
		 * @param {boolean} [options.disableHardNav] Disable sending SPA hard beacons
		 *
		 * @returns {@link BOOMR.plugins.SPA} The SPA plugin for chaining
		 * @memberof BOOMR.plugins.SPA
		 */
		hook: function(hadRouteChange, options) {
			options = options || {};



			// allow to set options each call in case they change

			if (typeof options.routeFilter === "function") {
				routeFilter = options.routeFilter;
			}

			if (typeof options.routeChangeWaitFilter === "function") {
				routeChangeWaitFilter = options.routeChangeWaitFilter;
			}

			if (options.disableHardNav) {
				disableHardNav = options.disableHardNav;
			}

			if (hooked) {
				return this;
			}

			if (hadRouteChange) {
				// kick off onLoadSpaHardMissed once onload has fired, or immediately
				// if onload has already fired
				BOOMR.attach_page_ready(this.onLoadSpaHardMissed);
			}

			hooked = true;

			return this;
		},

		/**
		 * Called by a framework when a route change has started.  The SPA plugin will
		 * begin monitoring downloadable resources to measure the SPA soft navigation.
		 *
		 * @param {function} onComplete Called on completion
		 * @param {object[]} routeFilterArgs Route Filter arguments
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		route_change: function(onComplete, routeFilterArgs) {


			var firedEvent = false;
			var initiator = firstSpaNav && !disableHardNav ? "spa_hard" : "spa";

			if (latestResource && latestResource.wait) {

				return;
			}

			// if we have a routeFilter, see if we want to track this SPA soft route
			if (initiator === "spa" && routeFilter) {
				try {
					if (!routeFilter.apply(null, routeFilterArgs)) {

						return;
					}
					else {

					}
				}
				catch (e) {
					BOOMR.addError(e, "SPA.route_change.routeFilter");
				}
			}

			// note we've had at least one route change
			initialRouteChangeStarted = true;

			// If this was the first request, use navStart as the begin timestamp.  Otherwise, use
			// "now" as the begin timestamp.
			var navigationStart = (BOOMR.plugins.RT && BOOMR.plugins.RT.navigationStart());
			var requestStart = initialRouteChangeCompleted ? BOOMR.now() : navigationStart;

			// use the document.URL even though it may be the URL of the previous nav. We will updated
			// it in AutoXHR sendEvent
			var url = BOOMR.window.document.URL;

			// construct the resource we'll be waiting for
			var resource = {
				timing: {
					requestStart: requestStart
				},
				initiator: initiator,
				url: url
			};

			firstSpaNav = false;

			if (!initialRouteChangeCompleted || typeof onComplete === "function") {
				initialRouteChangeCompleted = true;

				// if we haven't completed our initial SPA navigation yet (this is a hard nav), wait
				// for all of the resources to be downloaded
				resource.onComplete = function(onCompleteResource) {
					if (!firedEvent) {
						firedEvent = true;

						// fire a SPA navigation completed event so that other plugins can act on it
						BOOMR.fireEvent("spa_navigation");
					}

					if (typeof onComplete === "function") {
						onComplete(onCompleteResource);
					}
				};
			}

			// if we have a routeChangeWaitFilter, make sure AutoXHR waits on the custom event
			// for this SPA soft route
			if (initiator === "spa" && routeChangeWaitFilter) {

				try {
					if (routeChangeWaitFilter.apply(null, arguments)) {

						resource.wait = true;

						latestResource = resource;
					}
					else {

					}
				}
				catch (e) {
					BOOMR.addError(e, "SPA.route_change.routeChangeWaitFilter");
				}
			}

			// start listening for changes
			resource.index = BOOMR.plugins.AutoXHR.getMutationHandler().addEvent(resource);

			// re-enable AutoXHR if it's enabled
			if (autoXhrEnabled) {
				BOOMR.plugins.AutoXHR.enableAutoXhr();
			}
		},

		/**
		 * Called by a framework when the location has changed to the specified URL.
		 * This should be called prior to route_change() to use the specified URL.
		 *
		 * @param {string} url URL
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		last_location: function(url) {
			lastLocationChange = url;
		},

		/**
		 * Determine the current SPA navigation type (`spa` or `spa_hard`)
		 *
		 * @returns {string} SPA beacon type
		 * @memberof BOOMR.plugins.SPA
		 */
		current_spa_nav: function() {
			return !initialRouteChangeCompleted ? "spa_hard" : "spa";
		},

		/**
		 * Called by the SPA consumer if we have a `routeChangeWaitFilter` and are manually
		 * waiting for a custom event. The spa soft navigation will continue waiting for
		 * other nodes in progress
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		wait_complete: function() {
			if (latestResource) {
				latestResource.wait = false;

				if (latestResource.waitComplete) {

					latestResource.waitComplete();
				}

				latestResource = null;
			}
		},

		/**
		 * Marks the current navigation as complete and sends a beacon.
		 * The spa soft navigation will not wait for other nodes in progress
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		markNavigationComplete: function() {
			var i, ev, waiting, mh = BOOMR.plugins.AutoXHR.getMutationHandler();

			// if we're waiting due to a `routeChangeWaitFilter` then mark it complete
			if (latestResource && latestResource.wait) {
				BOOMR.plugins.SPA.wait_complete();
			}

			if (mh && mh.pending_events.length > 0) {
				for (i = mh.pending_events.length - 1; i >= 0; i--) {
					ev = mh.pending_events[i];
					if (ev && BOOMR.utils.inArray(ev.type, BOOMR.constants.BEACON_TYPE_SPAS)) {
						if (ev.complete) {
							// latest spa is not in progress
							break;
						}

						waiting = mh.nodesWaitingFor(i);



						// note that the navigation was forced complete
						BOOMR.addVar("spa.forced", "1");

						// add the count of nodes we were waiting for
						BOOMR.addVar("spa.waiting", waiting);

						// finalize this navigation
						mh.completeEvent(i);
						return;
					}
				}
			}

		},

		/**
		 * Determines if a SPA navigation is in progress
		 *
		 * @memberof BOOMR.plugins.SPA
		 */
		isSpaNavInProgress: function() {
			var i, ev, waiting, mh = BOOMR.plugins.AutoXHR.getMutationHandler();
			if (mh && mh.pending_events.length > 0) {
				for (i = mh.pending_events.length - 1; i >= 0; i--) {
					ev = mh.pending_events[i];
					if (ev && BOOMR.utils.inArray(ev.type, BOOMR.constants.BEACON_TYPE_SPAS)) {
						return !ev.complete;  // true if the latest spa nav is not complete
					}
				}
			}
			return false;
		}

	};
	BOOMR.plugins.SPA.waitComplete = BOOMR.plugins.SPA.wait_complete;

}());

/**
 * The History plugin allows you to automatically monitor Single Page
 * App (SPA) navigations that change their routes via the
 * [`window.history`](https://developer.mozilla.org/en-US/docs/Web/API/Window/history)
 * object.
 *
 * The History plugin can be used for any SPA, though if you are using
 * {@link BOOMR.plugins.Angular AngularJS}, {@link BOOMR.plugins.Ember Ember.js}
 * or {@link BOOMR.plugins.Backbone Backbone.js}, it is advised to use those
 * specific plugins instead.
 *
 * The History plugin should be used for React apps.
 *
 * **Note**: This plugin requires the {@link BOOMR.plugins.AutoXHR} and
 * {@link BOOMR.plugins.SPA} plugins to be loaded first (in that order).
 *
 * For details on how Boomerang Single Page App instrumentation works, see the
 * {@link BOOMR.plugins.SPA} documentation.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Compatibility
 *
 * This plugin should work with any Single Page App, by instrumenting the
 * [`window.history`](https://developer.mozilla.org/en-US/docs/Web/API/Window/history)
 * object to monitor for route changes.
 *
 * If you're using {@link BOOMR.plugins.Angular AngularJS}, {@link BOOMR.plugins.Ember Ember.js}
 * or {@link BOOMR.plugins.Backbone Backbone.js}, you are advised to use those
 * plugins instead, as they listen to other app lifecycle events.
 *
 * For React apps, you should use this plugin (with {@link BOOMR.plugins.History.init auto=false}
 * mode).
 *
 * ## Beacon Parameters
 *
 * This plugin does not add any additional beacon parameters beyond the
 * {@link BOOMR.plugins.SPA} plugin.
 *
 * ## Usage
 *
 * First, include the {@link BOOMR.plugins.SPA}, {@link BOOMR.plugins.History}
 * and {@link BOOMR.plugins.AutoXHR} plugins.  See {@tutorial building} for details.
 *
 * If you're using a SPA framework that utilizes the
 * [`window.history`](https://developer.mozilla.org/en-US/docs/Web/API/Window/history)
 * object, you should configure it with {@link BOOMR.plugins.History.init auto=true}.
 * This configures Boomerang to instrument the `window.history` object, and
 * nothing else needs to be done.
 *
 * If you are using React, you should configure this plugin with
 * {@link BOOMR.plugins.History.init auto=false}, and ensure you use the React
 * snippet below.  This configures Boomerang to instrument the React-specific
 * history object instead of `window.history`.
 *
 * ## React Configuration
 *
 * React exposes a history-like object that Boomerang instruments to listen for
 * lifecycle events.
 *
 * To configure React, you will need to export the `history` object from
 * React-Router:
 *
 * ```
 * import { useBasename } from "history";
 * import createHashHistory from "history/lib/createHashHistory";
 * import createBrowserHistory from "history/lib/createBrowserHistory";
 *
 * var history, hadRouteChange;
 *
 * // NOTE: Use only one of the two options below
 *
 * // If the browser supports native HTML5 routing via history:
 * history = useBasename(createBrowserHistory)({
 *   basename: location.pathname
 * });
 *
 * // If the browser only supports Hash-based routing:
 * history = createHashHistory();
 * ```
 *
 * After the `history` variable has been setup, include the following snippet:
 *
 * ```
 * function hookHistoryBoomerang() {
 *   if (window.BOOMR && BOOMR.version) {
 *     if (BOOMR.plugins && BOOMR.plugins.History) {
 *       BOOMR.plugins.History.hook(history, hadRouteChange);
 *     }
 *     return true;
 *   }
 * }
 *
 * if (!hookHistoryBoomerang()) {
 *   if (document.addEventListener) {
 *     document.addEventListener("onBoomerangLoaded", hookHistoryBoomerang);
 *   } else if (document.attachEvent) {
 *     document.attachEvent("onpropertychange", function(e) {
 *       e = e || window.event;
 *       if (e && e.propertyName === "onBoomerangLoaded") {
 *         hookHistoryBoomerang();
 *       }
 *     });
 *   }
 * }
 * ```
 *
 * @class BOOMR.plugins.History
 */
(function() {
	var impl = {
		auto: false,
		enabled: true,
		hooked: false,
		routeHooked: false,
		hadMissedRouteChange: false,
		routeChangeInProgress: false,  // will store the setTimeout id when set
		disableHardNav: false,  // whether or not to disable SPA hard beacons
		routeFilter: undefined,  // route change filter callback function
		routeChangeWaitFilter: undefined,  // route change wait filter callback function
		monitorReplaceState: true,  // whether or not to hook history.replaceState
		a: undefined,  // helper anchor object used to cleanup urls

		/**
		 * Clears routeChangeInProgress flag
		 */
		resetRouteChangeInProgress: function() {

			if (impl.routeChangeInProgress) {
				clearTimeout(impl.routeChangeInProgress);
			}
			impl.routeChangeInProgress = false;
		},

		/**
		 * Sets routeChangeInProgress flag and sets up timer to clear it later
		 */
		setRouteChangeInProgress: function() {
			if (impl.routeChangeInProgress) {
				clearTimeout(impl.routeChangeInProgress);
			}
			// reset our routeChangeInProgress flag as soon as the browser is free.
			// Current browser behavior favors sending internal events over calling
			// timeout callbacks. If for example the back button is clicked and a replaceState
			// is called then the popstate event should be triggered to extend this timeout before
			// the callback is called.
			impl.routeChangeInProgress = setTimeout(impl.resetRouteChangeInProgress, 50);
		},

		/**
		 * Fire SPA route init event
		 *
		 * @param {string} title Route title
		 * @param {string} url Route URL
		 */
		spaInit: function(title, url) {
			if (url) {
				BOOMR.fireEvent("spa_init", [BOOMR.plugins.SPA.current_spa_nav(), url]);
			}
			else if (title) {
				BOOMR.fireEvent("spa_init", [BOOMR.plugins.SPA.current_spa_nav(), title]);
			}
			else {
				BOOMR.fireEvent("spa_init", [BOOMR.plugins.SPA.current_spa_nav(), BOOMR.window.document.URL]);
			}
		},

		/**
		 * Called on route change
		 */
		routeChange: function(title, url) {
			if (!impl.enabled) {

				impl.hadMissedRouteChange = true;
				impl.resetRouteChangeInProgress();
			}
			else {
				// don't track the SPA route change until the onload (page_ready)
				// has fired
				if (impl.disableHardNav && !BOOMR.onloadFired()) {
					return;
				}

				if (!impl.routeChangeInProgress) {

					impl.spaInit(title, url);
					BOOMR.plugins.SPA.route_change();
				}
				else {

				}
			}
		}
	};




	// Checking for Plugins required and if already integrated
	if (BOOMR.plugins.History ||
	    typeof BOOMR.plugins.SPA === "undefined" ||
	    typeof BOOMR.plugins.AutoXHR === "undefined") {
		return;
	}

	// History object not available on the window object
	if (!BOOMR.window || !BOOMR.window.history) {
		return;
	}

	// register as a SPA plugin
	BOOMR.plugins.SPA.register("History");

	impl.a = BOOMR.window.document.createElement("A");


	/**
	 * Hook into `window.history` Object
	 *
	 * This function will override the following functions if available:
	 *   - pushState
	 *   - replaceState
	 *   - go
	 *   - back
	 *   - forward
	 * And listen to event:
	 *   - hashchange
	 *   - popstate
	 */
	function hook() {
		var history = BOOMR.window.history;

		/**
		 * Add event listener for `popstate`
		 */
		function aelPopstate() {
			BOOMR.window.addEventListener("popstate", function(event) {

				impl.routeChange();
			});
		}

		//
		// History API overrides
		//

		if (typeof history.pushState === "function") {
			history.pushState = (function(_pushState) {
				return function(state, title, url) {

					impl.routeChange(title, url);
					return _pushState.apply(this, arguments);
				};
			})(history.pushState);
		}

		if (impl.monitorReplaceState && typeof history.replaceState === "function") {
			history.replaceState = (function(_replaceState) {
				return function(state, title, url) {
					var fromUrl = BOOMR.window.document.URL, toUrl = fromUrl;

					// url is an optional param
					if (arguments.length >= 3 && typeof url !== "undefined" && url !== null) {
						impl.a.href = url;  // normalize url
						toUrl = impl.a.href;
					}

					// only issue route change if a nav is not in progress or the URL is changing
					if (!BOOMR.plugins.SPA.isSpaNavInProgress() || toUrl !== fromUrl) {

						impl.routeChange(title, url);
					}
					else {

					}

					return _replaceState.apply(this, arguments);
				};
			})(history.replaceState);
		}

		// we instrument go, back and forward because they are called earlier than the
		// popstate event which gives AutoXHR a chance to setup the MO
		if (typeof history.go === "function") {
			history.go = (function(_go) {
				return function(index) {
					var res;

					impl.routeChange();  // spa_init url will be the url before `go` runs
					return _go.apply(this, arguments);
				};
			})(history.go);
		}

		if (typeof history.back === "function") {
			history.back = (function(_back) {
				return function() {
					var res;

					impl.routeChange();  // spa_init url will be the url before `back` runs
					return _back.apply(this, arguments);
				};
			})(history.back);
		}

		if (typeof history.forward === "function") {
			history.forward = (function(_forward) {
				return function() {
					var res;

					impl.routeChange();  // spa_init url will be the url before `forward` runs
					return _forward.apply(this, arguments);
				};
			})(history.forward);
		}

		// listen for hash changes
		BOOMR.window.addEventListener("hashchange", function(event) {
			var url = (event || {}).newURL;

			impl.routeChange(null, url);
		});

		// add listener for popstate after page load has occured so that we don't receive an unwanted popstate
		// event at onload
		if (BOOMR.hasBrowserOnloadFired()) {
			aelPopstate();
		}
		else {
			// the event listener will be registered early enough to get an unwanted event if we don't use setTimeout
			BOOMR.window.addEventListener("load", function() { setTimeout(aelPopstate, 0); });
		}

		// listen for a beacon
		BOOMR.subscribe("beacon", impl.resetRouteChangeInProgress);

		// listen for spa cancellations
		BOOMR.subscribe("spa_cancel", impl.resetRouteChangeInProgress);

		// listen for spa inits. We're adding this to catch the event sent by the SPA plugin
		BOOMR.subscribe("spa_init", impl.setRouteChangeInProgress);

		return true;
	};

	//
	// Exports
	//
	BOOMR.plugins.History = {
		/**
		 * This plugin is always complete (ready to send a beacon)
		 *
		 * @returns {boolean} `true`
		 * @memberof BOOMR.plugins.History
		 */
		is_complete: function() {
			return true;
		},

		/**
		 * Hooks Boomerang into the History events.
		 *
		 * @param {object} history No longer used
		 * @param {boolean} [hadRouteChange] Whether or not there was a route change
		 * event prior to this `hook()` call
		 * @param {object} [options] Optional options. Can contain `routeFilter` and/or `routeChangeWaitFilter`
		 *
		 * @returns {@link BOOMR.plugins.History} The History plugin for chaining
		 * @memberof BOOMR.plugins.History
		 */
		hook: function(history, hadRouteChange, options) {
			options = options || {};
			options.disableHardNav = impl.disableHardNav;

			if (impl.hooked) {
				return this;
			}

			if (impl.routeFilter) {
				options.routeFilter = impl.routeFilter;
			}

			if (impl.routeChangeWaitFilter) {
				options.routeChangeWaitFilter = impl.routeChangeWaitFilter;
			}

			if (hook()) {
				BOOMR.plugins.SPA.hook(hadRouteChange, options);
				impl.hooked = true;
			}

			return this;
		},

		/**
		 * Initializes the plugin.
		 *
		 * @param {object} config Configuration
		 * @param {boolean} [config.History.auto] Whether or not to automatically
		 * instrument the `window.history` object.
		 * If set to `false`, the React snippet should be used.
		 * @param {boolean} [config.History.disableHardNav] Whether or not to disable SPA hard beacons
		 * @param {function} [config.History.routeFilter] Route change filter callback function
		 * @param {function} [config.History.routeChangeWaitFilter] Route change wait filter callback function
		 * @param {boolean} [config.History.monitorReplaceState] Whether or not to hook History.replaceState
		 *
		 * @returns {@link BOOMR.plugins.History} The History plugin for chaining
		 * @example
		 * BOOMR.init({
		 *   History: {
		 *     auto: true
		 *   });
		 * });
		 * @memberof BOOMR.plugins.History
		 */
		init: function(config) {
			BOOMR.utils.pluginConfig(impl, config, "History",
				["auto", "enabled", "disableHardNav",
				 "routeFilter", "routeChangeWaitFilter",
				 "monitorReplaceState"]);

			if (impl.auto && impl.enabled) {
				this.hook(undefined, true, {});
			}

			return this;
		},

		/**
		 * Disables the History plugin
		 *
		 * @returns {@link BOOMR.plugins.History} The History plugin for chaining
		 * @memberof BOOMR.plugins.History
		 */
		disable: function() {
			impl.enabled = false;
			return this;
		},

		/**
		 * Enables the History plugin
		 *
		 * @returns {@link BOOMR.plugins.History} The History plugin for chaining
		 * @memberof BOOMR.plugins.History
		 */
		enable: function() {
			impl.enabled = true;

			if (impl.hooked && impl.hadMissedRouteChange) {
				impl.hadMissedRouteChange = false;
				BOOMR.plugins.SPA.route_change();
				impl.setRouteChangeInProgress();

			}

			return this;
		}
	};
}());

/**
 * The roundtrip (RT) plugin measures page load time, or other timers associated with the page.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Beacon Parameters
 *
 * This plugin adds the following parameters to the beacon:
 *
 * * `t_done`: Perceived load time of the page.
 * * `t_page`: Time taken from the head of the page to {@link BOOMR#event:page_ready}.
 * * `t_page.inv`: If there was a problem detected with the start/end times of `t_page`.
 *    This can happen due to bugs in NavigationTiming clients, where `responseEnd`
 *    happens after all other NavigationTiming events.
 * * `t_resp`: Time taken from the user initiating the request to the first byte of the response.
 * * `t_other`: Comma separated list of additional timers set by page developer.
 *   Each timer is of the format `name|value`
 * * `t_load`: If the page were prerendered, this is the time to fetch and prerender the page.
 * * `t_prerender`: If the page were prerendered, this is the time from start of
 *   prefetch to the actual page display. It may only be useful for debugging.
 * * `t_postrender`: If the page were prerendered, this is the time from prerender
 *   finish to actual page display. It may only be useful for debugging.
 * * `vis.pre`: `1` if the page transitioned from prerender to visible
 * * `r`: URL of page that set the start time of the beacon.
 * * `nu`: URL of next page if the user clicked a link or submitted a form
 * * `rt.start`: Specifies where the start time came from. May be one of:
 *   - `cookie` for the start cookie
 *   - `navigation` for the W3C NavigationTiming API,
 *   - `csi` for older versions of Chrome or gtb for the Google Toolbar.
 *   - `manual` for XHR beacons
 *   - `none` if the start could not be detected
 * * `rt.tstart`: The start time timestamp.
 * * `rt.nstart`: The `navigationStart` timestamp, if different from `rt.tstart.  This could
 *    happen for XHR beacons, where `rt.tstart` is the start of the XHR fetch, and `nt_nav_st`
 *    won't be on the beacon.  It could also happen for SPA Soft beacons, where `rt.tstart`
 *    is the start of the Soft Navigation.
 * * `rt.cstart`: The start time stored in the cookie if different from rt.tstart.
 * * `rt.bstart`: The timestamp when boomerang started executing.
 * * `rt.blstart`: The timestamp when the boomerang was added to the host page.
 * * `rt.end`: The timestamp when the `t_done` timer ended
 *   (`rt.end - rt.tstart === t_done`)
 * * `rt.bmr`: Several parameters that include resource timing information for
 *   boomerang itself, ie, how long did boomerang take to load
 * * `rt.subres`: Set to `1` if this beacon is for a sub-resource of a primary
 *    page beacon. This is typically set by XHR beacons, and you will need to
 *    use a separate identifier to tie the primary beacon and the subresource
 *    beacon together on the server-side.
 * * `rt.quit`: This parameter will exist (but have no value) if the beacon was
 *    fired as part of the `onbeforeunload` event. This is typically used to
 *    find out how much time the user spent on the page before leaving, and is
 *    not guaranteed to fire.
 * * `rt.abld`: This parameter will exist (but have no value) if the `onbeforeunload`
 *    event fires before the `onload` event fires. This can happen, for example,
 *    if the user left the page before it completed loading.
 * * `rt.ntvu`: This parameter will exist (but have no value) if the `onbeforeunload`
 *    event fires before the page ever became visible. This can happen if the
 *    user opened the page in a background tab, and closed it without viewing it,
 *    and also if the page was pre-rendered, but never made visible. Use this
 *    to check your pre-render success ratio.
 * * `http.method`: For XHR beacons, the HTTP method if not `GET`.
 * * `http.errno`: For XHR beacons, the HTTP result code if not 200.
 * * `http.hdr`: For XHR beacons, headers if available.
 * * `http.type`: For XHR beacons, value of `f` for fetch API requests. Not set for XHRs.
 * * `xhr.sync`: For XHR beacons, `1` if it was sent synchronously.
 * * `http.initiator`: The initiator of the beacon:
 *   - (empty/missing) for the page load beacon
 *   - `xhr` for XHR beacons
 *   - `spa` for SPA Soft Navigations
 *   - `spa_hard` for SPA Hard Navigations
 * * `fetch.bnu`: For XHR beacons from fetch API requests, `1` if fetch response body was not used.
 *
 * ## Cookie
 *
 * The session information is stored within a cookie.
 *
 * You can customise the name of the cookie where the session information
 * will be stored via the {@link BOOMR.plugins.RT.init RT.cookie} option.
 *
 * By default this is set to `RT`.
 *
 * This cookie is set to expire in 7 days. You can change its lifetime using
 * the {@link BOOMR.plugins.RT.init RT.cookie_exp} option.
 *
 * During that time, you can also read the value of the cookie on the server
 * side. Its format is as follows:
 *
 * ```
 * RT="ss=nnnnnnn&si=abc-123...";
 * ```
 *
 * The parameters are defined as:
 *
 * * `ss` [string] [timestamp] Session Start (Base36)
 * * `si` [string] [guid] Session ID
 * * `sl` [string] [count] Session Length (Base36)
 * * `tt` [string] [ms] Sum of Load Times across the session (Base36)
 * * `obo` [string] [count] Number of pages in the session that had no load time (Base36)
 * * `dm` [string] [domain] Cookie domain
 * * `bcn` [string] [URL] Beacon URL
 * * `rl` [number] [boolean] Whether or not the session is Rate Limited
 * * `se` [string] [s] Session expiry (Base36)
 * * `ld` [string] [timestamp] Last load time (Base36, offset by ss)
 * * `ul` [string] [timestamp] Last beforeunload time (Base36, offset by ss)
 * * `hd` [string] [timestamp] Last unload time (Base36, offset by ss)
 * * `cl` [string] [timestamp] Last click time (Base36, offset by ss)
 * * `r` [string] [URL] Referrer URL (hashed, only if NavigationTiming isn't
 * *   supported and if strict_referrer is enabled)
 * * `nu` [string] [URL] Clicked URL (hashed)
 * * `z` [number] [flags] Compression flags
 *
 * @class BOOMR.plugins.RT
 */

// This is the Round Trip Time plugin.  Abbreviated to RT
// the parameter is the window
(function(w) {
	var d, impl,
	    COOKIE_EXP = 60 * 60 * 24 * 7;

	var SESSION_EXP = 60 * 30;

	/**
	 * Whether or not the cookie has compressed timestamps
	 */
	var COOKIE_COMPRESSED_TIMESTAMPS = 0x1;




	if (BOOMR.plugins.RT) {
		return;
	}

	// private object
	impl = {
		// Set when the page_ready event fires.
		// Use this to determine if unload fires before onload.
		onloadfired: false,

		// Set when the first unload event fires.
		// Use this to make sure we don't beacon twice for beforeunload and
		// unload.
		unloadfired: false,

		// Set when page becomes visible (for browsers that support it).
		// Use this to determine if user bailed without opening the tab.
		visiblefired: false,

		// Set when init has completed to prevent double initialization.
		initialized: false,

		// Set when this plugin has completed.
		complete: false,

		// Whether or not Boomerang is set to run at onload.
		autorun: true,

		// Custom timers that the developer can use.
		// Format for each timer is { start: XXX, end: YYY, delta: YYY-XXX }
		timers: {},

		// Name of the cookie that stores the start time and referrer.
		cookie: "RT",

		// Cookie expiry in seconds (7 days)
		cookie_exp: COOKIE_EXP,

		// Session expiry in seconds (30 minutes)
		session_exp: SESSION_EXP,

		// By default, don't beacon if referrers don't match.
		// If set to false, beacon both referrer values and let the back-end decide.
		strict_referrer: true,

		// Navigation Type from the NavTiming API.  We mainly care if this was
		// BACK_FORWARD since cookie time will be incorrect in that case.
		navigationType: 0,

		// Navigation Start time.
		navigationStart: undefined,

		// Response Start time.
		responseStart: undefined,

		// Total load time for the user session.
		loadTime: 0,

		// Number of pages in the session that had no load time.
		oboError: 0,

		// t_start that came off the cookie.
		t_start: undefined,

		// Cached value of t_start once we know its real value.
		cached_t_start: undefined,

		// Cached value of xhr t_start once we know its real value.
		cached_xhr_start: undefined,

		// Approximate first byte time for browsers that don't support NavigationTiming.
		t_fb_approx: undefined,

		// Referrer (hash) from the cookie.
		r: undefined,

		// Beacon server for the current session.
		// This could get reset at the end of the session.
		beacon_url: undefined,

		// beacon_url to use when session expires.
		next_beacon_url: undefined,

		// These timers are added directly as beacon variables.
		basic_timers: {
			t_done: 1,
			t_resp: 1,
			t_page: 1
		},

		// Whether or not this is a Cross-Domain load and we're sending session
		// details.
		crossdomain_sending: false,

		// Vars that were added to the beacon that we can remove after beaconing
		addedVars: [],

		/**
		 * Merge new cookie `params` onto current cookie, and set `timer` param on cookie to current timestamp
		 *
		 * @param {object} params Object containing keys & values to merge onto current cookie.  A value of `undefined`
		 *     will remove the key from the cookie
		 * @param {string} timer String key name that will be set to the current timestamp on the cookie
		 *
		 * @returns {boolean} true if the cookie was updated, false if the cookie could not be set for any reason
		 */
		updateCookie: function(params, timer) {
			var t_end, t_start, subcookies, k;

			// Disable use of RT cookie by setting its name to a falsy value
			if (!this.cookie) {
				return false;
			}

			// Get the cookie (don't decompress the values)
			subcookies = BOOMR.utils.getSubCookies(BOOMR.utils.getCookie(this.cookie)) || {};

			// Numeric indices were a bug, we need to clean it up
			for (k in subcookies) {
				if (subcookies.hasOwnProperty(k)) {
					if (!isNaN(parseInt(k, 10))) {
						delete subcookies[k];
					}
				}
			}

			if (typeof params === "object") {
				for (k in params) {
					if (params.hasOwnProperty(k)) {
						if (params[k] === undefined) {
							if (subcookies.hasOwnProperty(k)) {
								delete subcookies[k];
							}
						}
						else {
							subcookies[k] = params[k];
						}
					}
				}
			}

			// compresion level
			subcookies.z = COOKIE_COMPRESSED_TIMESTAMPS;

			// domain
			subcookies.dm = BOOMR.session.domain;

			// session ID
			subcookies.si = BOOMR.session.ID;

			// session start
			subcookies.ss = BOOMR.session.start.toString(36);

			// session length
			subcookies.sl = BOOMR.session.length.toString(36);

			// session expiry
			if (impl.session_exp !== SESSION_EXP) {
				subcookies.se = impl.session_exp.toString(36);
			}

			// rate limited
			if (BOOMR.session.rate_limited) {
				subcookies.rl = 1;
			}

			// total time
			subcookies.tt = this.loadTime.toString(36);

			// off-by-one
			if (this.oboError > 0) {
				subcookies.obo = this.oboError.toString(36);
			}
			else {
				delete subcookies.obo;
			}

			t_start = BOOMR.now();

			// sub-timer
			if (timer) {
				subcookies[timer] = (t_start - BOOMR.session.start).toString(36);
				impl.lastActionTime = t_start;
			}

			// If we got a beacon_url from config, set it into the cookie
			if (this.beacon_url) {
				subcookies.bcn = this.beacon_url;
			}


			if (!BOOMR.utils.setCookie(this.cookie, subcookies, this.cookie_exp)) {
				BOOMR.error("cannot set start cookie", "rt");
				return false;
			}

			t_end = BOOMR.now();
			if (t_end - t_start > 50) {
				// It took > 50ms to set the cookie
				// The user Most likely has cookie prompting turned on so
				// t_start won't be the actual unload time
				// We bail at this point since we can't reliably tell t_done
				BOOMR.utils.removeCookie(this.cookie);

				// at some point we may want to log this info on the server side
				BOOMR.error("took more than 50ms to set cookie... aborting: " +
					t_start + " -> " + t_end, "rt");
			}

			return true;
		},

		/**
		 * Update in memory session with values from the cookie.
		 *
		 * For server-driven Boomerang, many of these values might come through
		 * a configuration file (config.json), but we need them before config.json comes through,
		 * or in cases where we're rate limited, or the server is down, config.json may never
		 * come through, so we hold them in a cookie.
		 *
		 * @param subcookies  [optional] object containing cookie keys & values. If not set, will use current cookie value.
		 * Recognised keys:
		 * - ss: sesion start
		 * - si: session ID
		 * - sl: session length
		 * - tt: sum of load times across session
		 * - obo: pages in session that did not have a load time
		 * - dm: domain to use when setting cookies
		 * - se: session expiry time
		 * - bcn: URL that beacons should be sent to
		 * - rl: rate limited flag. 1 if rate limited
		 */
		refreshSession: function(subcookies) {
			if (!subcookies) {
				subcookies = BOOMR.plugins.RT.getCookie();
			}

			if (!subcookies) {
				return;
			}

			if (subcookies.ss) {
				BOOMR.session.start = subcookies.ss;
			}
			else {
				// If the cookie didn't have a good session start time, we'll use the earliest
				// time that we know about... either when the boomerang loader showed up on page
				// or when the first bytes of boomerang loaded up.
				BOOMR.session.start = BOOMR.t_lstart || BOOMR.t_start;
			}

			if (subcookies.si && subcookies.si.match(/-/)) {
				BOOMR.session.ID = subcookies.si;
			}

			if (subcookies.sl) {
				BOOMR.session.length = subcookies.sl;
			}

			if (subcookies.tt) {
				this.loadTime = subcookies.tt;
			}

			if (subcookies.obo) {
				this.oboError = subcookies.obo;
			}

			if (subcookies.dm && !BOOMR.session.domain) {
				BOOMR.session.domain = subcookies.dm;
			}

			if (subcookies.se) {
				impl.session_exp = subcookies.se;
			}

			if (subcookies.bcn) {
				this.beacon_url = subcookies.bcn;
			}

			if (subcookies.rl && subcookies.rl === "1") {
				BOOMR.session.rate_limited = true;
			}
		},

		/**
		 * Determine if session has expired or not, and if so, reset session values to a new session.
		 *
		 * @param t_done  The timestamp right now.  Used to determine if the session is too old
		 * @param t_start The timestamp when this page was requested (or undefined if unknown).  Used to reset session start time
		 *
		 */
		maybeResetSession: function(t_done, t_start) {



			// determine the average page session length, which is the session length over # of pages
			var avgSessionLength = 0;
			if (BOOMR.session.start && BOOMR.session.length) {
				avgSessionLength = (BOOMR.now() - BOOMR.session.start) / BOOMR.session.length;
			}

			var sessionExp = impl.session_exp * 1000;

			// if session hasn't started yet, or if it's been more than thirty minutes since the last beacon,
			// reset the session (note 30 minutes is an industry standard limit on idle time for session expiry)

			// no start time
			if (!BOOMR.session.start ||
			    // or we have a better start time
			    (t_start && BOOMR.session.start > t_start) ||
			    // or it's been more than session_exp since the last action
			    t_done - (impl.lastActionTime || BOOMR.t_start) > sessionExp ||
			    // or the average page session length is longer than the session exp
			    (avgSessionLength > sessionExp)
			) {
				// Now we reset the session
				BOOMR.session.start = t_start || BOOMR.t_lstart || BOOMR.t_start;
				BOOMR.session.length = 0;
				BOOMR.session.rate_limited = false;
				impl.loadTime = 0;
				impl.oboError = 0;
				impl.beacon_url = impl.next_beacon_url;
				impl.lastActionTime = t_done;

				// Update the cookie with these new values
				// we also reset the rate limited flag since
				// new sessions do not inherit the rate limited
				// state of old sessions
				impl.updateCookie({
					"rl": undefined,
					"sl": BOOMR.session.length,
					"ss": BOOMR.session.start,
					"tt": impl.loadTime,
					"obo": undefined, // since it's 0
					"bcn": impl.beacon_url
				});
			}



		},

		/**
		 * Read initial values from cookie and clear out cookie values it cares about after reading.
		 * This makes sure that other pages (eg: loaded in new tabs) do not get an invalid cookie time.
		 * This method should only be called from init, and may be called more than once.
		 *
		 * Request start time is the greater of last page beforeunload or last click time
		 * If start time came from a click, we check that the clicked URL matches the current URL
		 * If it came from a beforeunload, we check that cookie referrer matches document.referrer
		 *
		 * If we had a pageHide time or unload time, we use that as a proxy for first byte on non-navtiming
		 * browsers.
		 */
		initFromCookie: function() {
			var urlHash, docReferrerHash, subcookies;
			subcookies = BOOMR.plugins.RT.getCookie();

			if (!this.cookie) {
				BOOMR.session.enabled = false;
			}
			if (!subcookies) {
				return;
			}

			subcookies.s = Math.max(+subcookies.ld || 0, Math.max(+subcookies.ul || 0, +subcookies.cl || 0));



			// If we have a start time, and either a referrer, or a clicked on URL,
			// we check if the start time is usable.
			if (subcookies.s && (subcookies.r || subcookies.nu)) {
				this.r = subcookies.r;
				urlHash = BOOMR.utils.MD5(d.URL);
				docReferrerHash = BOOMR.utils.MD5((d && d.referrer) || "");

				// Either the URL of the page setting the cookie needs to match document.referrer


				// Or the start timer was no more than 15ms after a click or form submit
				// and the URL clicked or submitted to matches the current page's URL
				// (note the start timer may be later than click if both click and beforeunload fired
				// on the previous page)
				if (subcookies.cl) {

				}
				if (subcookies.nu) {

				}

				if (!this.strict_referrer ||
					(subcookies.cl && subcookies.nu && subcookies.nu === urlHash && subcookies.s < +subcookies.cl + 15) ||
					(subcookies.s === +subcookies.ul && this.r === docReferrerHash)
				) {
					this.t_start = subcookies.s;

					// additionally, if we have a pagehide, or unload event, that's a proxy
					// for the first byte of the current page, so use that wisely
					if (+subcookies.hd > subcookies.s) {
						this.t_fb_approx = subcookies.hd;
					}
				}
				else {
					this.t_start = this.t_fb_approx = undefined;
				}
			}

			// regardless of whether the start time was usable or not, it's the last action that
			// we measured, so use that for the session
			if (subcookies.s) {
				this.lastActionTime = subcookies.s;
			}

			this.refreshSession(subcookies);

			// Now that we've pulled out the timers, we'll clear them so they don't pollute future calls
			this.updateCookie({
				// timers
				s: undefined,  // start timer
				ul: undefined, // onbeforeunload time
				cl: undefined, // onclick time
				hd: undefined, // onunload or onpagehide time
				ld: undefined, // last load time

				// session info
				rl: undefined, // rate limited

				// URLs
				r: undefined,  // referrer
				nu: undefined, // clicked url

				// deprecated
				sh: undefined  // session history
			});

			this.maybeResetSession(BOOMR.now());
		},

		/**
		 * Increment session length, and either session.obo or session.loadTime whichever is appropriate for this page
		 */
		incrementSessionDetails: function() {

			BOOMR.session.length++;

			if (isNaN(impl.timers.t_done.delta)) {
				impl.oboError++;
			}
			else {
				impl.loadTime += impl.timers.t_done.delta;
			}
		},

		/**
		 * Figure out how long boomerang and other URLs took to load using
		 * ResourceTiming if available, or built in timestamps.
		 */
		getBoomerangTimings: function() {
			var res, urls, url, startTime, data;

			function trimTiming(time, st) {
				// strip from microseconds to milliseconds only
				var timeMs = Math.round(time ? time : 0),
				    startTimeMs = Math.round(st ? st : 0);

				timeMs = (timeMs === 0 ? 0 : (timeMs - startTimeMs));

				return timeMs ? timeMs : "";
			}

			if (BOOMR.t_start) {
				// How long does it take Boomerang to load up and execute (fb to lb)?
				BOOMR.plugins.RT.startTimer("boomerang", BOOMR.t_start);
				BOOMR.plugins.RT.endTimer("boomerang", BOOMR.t_end);	// t_end === null defaults to current time

				// How long did it take from page request to boomerang fb?
				BOOMR.plugins.RT.endTimer("boomr_fb", BOOMR.t_start);

				if (BOOMR.t_lstart) {
					// when did the boomerang loader start loading boomerang on the page?
					BOOMR.plugins.RT.endTimer("boomr_ld", BOOMR.t_lstart);
					// What was the network latency for boomerang (request to first byte)?
					BOOMR.plugins.RT.setTimer("boomr_lat", BOOMR.t_start - BOOMR.t_lstart);
				}
			}

			// use window and not w because we want the inner iframe
			try {
				if (window &&
				    "performance" in window &&
				    window.performance &&
				    typeof window.performance.getEntriesByName === "function") {
					urls = { "rt.bmr": BOOMR.url };

					if (BOOMR.config_url) {
						urls["rt.cnf"] = BOOMR.config_url;
					}

					for (url in urls) {
						if (urls.hasOwnProperty(url) && urls[url]) {
							res = window.performance.getEntriesByName(urls[url]);
							if (!res || res.length === 0 || !res[0]) {
								continue;
							}

							res = res[0];

							startTime = trimTiming(res.startTime, 0);
							data = [
								startTime,
								trimTiming(res.responseEnd, startTime),
								trimTiming(res.responseStart, startTime),
								trimTiming(res.requestStart, startTime),
								trimTiming(res.connectEnd, startTime),
								trimTiming(res.secureConnectionStart, startTime),
								trimTiming(res.connectStart, startTime),
								trimTiming(res.domainLookupEnd, startTime),
								trimTiming(res.domainLookupStart, startTime),
								trimTiming(res.redirectEnd, startTime),
								trimTiming(res.redirectStart, startTime)
							].join(",").replace(/,+$/, "");

							BOOMR.addVar(url, data);
							impl.addedVars.push(url);
						}
					}
				}
			}
			catch (e) {
				BOOMR.addError(e, "rt.getBoomerangTimings");
			}
		},

		/**
		 * Check if we're in a prerender state, and if we are, set additional timers.
		 * In Chrome/IE, a prerender state is when a page is completely rendered in an in-memory buffer, before
		 * a user requests that page.  We do not beacon at this point because the user has not shown intent
		 * to view the page.  If the user opens the page, the visibility state changes to visible, and we
		 * fire the beacon at that point, including any timing details for prerendering.
		 *
		 * Sets the `t_load` timer to the actual value of page load time (request initiated by browser to onload)
		 *
		 * @returns true if this is a prerender state, false if not (or not supported)
		 */
		checkPreRender: function() {
			if (BOOMR.visibilityState() !== "prerender") {
				return false;
			}

			// This means that onload fired through a pre-render.  We'll capture this
			// time, but wait for t_done until after the page has become either visible
			// or hidden (ie, it moved out of the pre-render state)
			// http://code.google.com/chrome/whitepapers/pagevisibility.html
			// http://www.w3.org/TR/2011/WD-page-visibility-20110602/
			// http://code.google.com/chrome/whitepapers/prerender.html

			BOOMR.plugins.RT.startTimer("t_load", this.navigationStart);
			BOOMR.plugins.RT.endTimer("t_load");					// this will measure actual onload time for a prerendered page
			BOOMR.plugins.RT.startTimer("t_prerender", this.navigationStart);
			BOOMR.plugins.RT.startTimer("t_postrender");				// time from prerender to visible or hidden

			return true;
		},

		/**
		 * Initialise timers from the NavigationTiming API.  This method looks at various sources for
		 * Navigation Timing, and also patches around bugs in various browser implementations.
		 * It sets the beacon parameter `rt.start` to the source of the timer
		 */
		initFromNavTiming: function() {
			var ti, p, source;

			if (this.navigationStart) {
				return;
			}

			// Get start time from WebTiming API see:
			// https://dvcs.w3.org/hg/webperf/raw-file/tip/specs/NavigationTiming/Overview.html
			// http://blogs.msdn.com/b/ie/archive/2010/06/28/measuring-web-page-performance.aspx
			// http://blog.chromium.org/2010/07/do-you-know-how-slow-your-web-page-is.html
			p = BOOMR.getPerformance();

			if (p && p.navigation) {
				this.navigationType = p.navigation.type;
			}

			if (p && p.timing) {
				ti = p.timing;
			}
			else if (w.chrome && w.chrome.csi && w.chrome.csi().startE) {
				// Older versions of chrome also have a timing API that's sort of documented here:
				// http://ecmanaut.blogspot.com/2010/06/google-bom-feature-ms-since-pageload.html
				// source here:
				// http://src.chromium.org/viewvc/chrome/trunk/src/chrome/renderer/loadtimes_extension_bindings.cc?view=markup
				ti = {
					navigationStart: w.chrome.csi().startE
				};
				source = "csi";
			}
			else if (w.gtbExternal && w.gtbExternal.startE()) {
				// The Google Toolbar exposes navigation start time similar to old versions of chrome
				// This would work for any browser that has the google toolbar installed
				ti = {
					navigationStart: w.gtbExternal.startE()
				};
				source = "gtb";
			}

			if (ti) {
				// Always use navigationStart since it falls back to fetchStart (not with redirects)
				// If not set, we leave t_start alone so that timers that depend
				// on it don't get sent back.  Never use requestStart since if
				// the first request fails and the browser retries, it will contain
				// the value for the new request.
				BOOMR.addVar("rt.start", source || "navigation");
				this.navigationStart = ti.navigationStart || ti.fetchStart || undefined;
				this.fetchStart = ti.fetchStart || undefined;
				this.responseStart = ti.responseStart || undefined;

				// bug in Firefox 7 & 8 https://bugzilla.mozilla.org/show_bug.cgi?id=691547
				if (navigator.userAgent.match(/Firefox\/[78]\./)) {
					this.navigationStart = ti.unloadEventStart || ti.fetchStart || undefined;
				}
			}
			else {
				BOOMR.warn("This browser doesn't support the WebTiming API", "rt");
			}

			return;
		},

		/**
		 * Validate that the time we think is the load time is correct.  This can be wrong if boomerang was loaded
		 * after onload, so in that case, if navigation timing is available, we use that instead.
		 */
		validateLoadTimestamp: function(t_now, data, ename) {
			var p;

			// beacon with detailed timing information
			if (data && data.timing && data.timing.loadEventEnd) {
				return data.timing.loadEventEnd;
			}
			else if (ename === "xhr" && (!data || !BOOMR.utils.inArray(data.initiator, BOOMR.constants.BEACON_TYPE_SPAS))) {
				// if this is an XHR event, trust the input end "now" timestamp
				return t_now;
			}
			else {
				// use loadEventEnd from NavigationTiming
				p = BOOMR.getPerformance();

				// We have navigation timing,
				if (p && p.timing) {
					// and the loadEventEnd timestamp
					if (p.timing.loadEventEnd) {
						return p.timing.loadEventEnd;
					}
				}
				// We don't have navigation timing,
				else {
					// So we'll just use the time when boomerang was added to the page
					// Assuming that this means boomerang was added in onload.  If we logged the
					// onload timestamp (via loader snippet), use that first.
					return BOOMR.t_onload || BOOMR.t_lstart || BOOMR.t_start || t_now;
				}
			}

			// default to now
			return t_now;
		},

		/**
		 * Set timers appropriate at page load time.  This method should be called from done() only when
		 * the page_ready event fires.  It sets the following timer values:
		 *		- t_resp:	time from request start to first byte
		 *		- t_page:	time from first byte to load
		 *		- t_postrender	time from prerender state to visible state
		 *		- t_prerender	time from navigation start to visible state
		 *
		 * @param ename  The Event name that initiated this control flow
		 * @param t_done The timestamp when the done() method was called
		 * @param data   Event data passed in from the caller.  For xhr beacons, this may contain detailed timing information
		 *
		 * @returns true if timers were set, false if we're in a prerender state, caller should abort on false.
		 */
		setPageLoadTimers: function(ename, t_done, data) {
			var t_resp_start, t_fetch_start, p, navSt;

			if (ename !== "xhr") {
				impl.initFromCookie();
				impl.initFromNavTiming();

				if (impl.checkPreRender()) {
					return false;
				}
			}

			if (ename === "xhr") {
				if (data.timers) {
					// If we were given a list of timers, set those first
					for (var timerName in data.timers) {
						if (data.timers.hasOwnProperty(timerName)) {
							BOOMR.plugins.RT.setTimer(timerName, data.timers[timerName]);
						}
					}
				}
				else if (data && data.timing) {
					// Use details from XHR object to figure out responce latency and page time. Use
					// responseEnd (instead of responseStart) since it's not until responseEnd
					// that the browser can consume the data, and responseEnd is the only guarateed
					// timestamp with cross-origin XHRs if ResourceTiming is enabled.

					t_fetch_start = data.timing.fetchStart;

					if (typeof t_fetch_start === "undefined" || data.timing.responseEnd >= t_fetch_start) {
						t_resp_start = data.timing.responseEnd;
					}
				}
			}
			else if (impl.responseStart) {
				// Use NavTiming API to figure out resp latency and page time
				// t_resp will use the cookie if available or fallback to NavTiming

				// only use if the time looks legit (after navigationStart/fetchStart)
				if (impl.responseStart >= impl.navigationStart &&
				    impl.responseStart >= impl.fetchStart) {
					t_resp_start = impl.responseStart;
				}
			}
			else if (impl.timers.hasOwnProperty("t_page")) {
				// If the dev has already started t_page timer, we can end it now as well
				BOOMR.plugins.RT.endTimer("t_page");
			}
			else if (impl.t_fb_approx) {
				// If we have an approximate first byte time from the cookie, use it
				t_resp_start = impl.t_fb_approx;
			}

			if (t_resp_start) {
				// if we have a fetch start as well, set the specific timestamps instead of from rt.start
				if (t_fetch_start) {
					BOOMR.plugins.RT.setTimer("t_resp", t_fetch_start, t_resp_start);
				}
				else {
					BOOMR.plugins.RT.endTimer("t_resp", t_resp_start);
				}

				// t_load is the actual time load completed if using prerender
				if (ename === "load" && impl.timers.t_load) {
					BOOMR.plugins.RT.setTimer("t_page", impl.timers.t_load.end - t_resp_start);
				}
				else {
					//
					// Ensure that t_done is after t_resp_start.  If not, set a var so we
					// knew there was an inversion.  This can happen due to bugs in NavTiming
					// clients, where responseEnd happens after all other NavTiming events.
					//
					if (t_done < t_resp_start) {
						BOOMR.addVar("t_page.inv", 1);
					}
					else {
						BOOMR.plugins.RT.setTimer("t_page", t_done - t_resp_start);
					}
				}
			}

			// If a prerender timer was started, we can end it now as well
			if (ename === "load" && impl.timers.hasOwnProperty("t_postrender")) {
				BOOMR.plugins.RT.endTimer("t_postrender");
				BOOMR.plugins.RT.endTimer("t_prerender");
			}

			return true;
		},

		/**
		 * Writes a bunch of timestamps onto the beacon that help in request tracing on the server
		 * - rt.tstart: The value of t_start that we determined was appropriate
		 * - rt.nstart: The value of navigationStart if different from rt.tstart
		 * - rt.cstart: The value of t_start from the cookie if different from rt.tstart
		 * - rt.bstart: The timestamp when boomerang started
		 * - rt.blstart:The timestamp when boomerang was added to the host page
		 * - rt.end:    The timestamp when the t_done timer ended
		 *
		 * @param t_start The value of t_start that we plan to use
		 */
		setSupportingTimestamps: function(t_start) {
			if (t_start) {
				BOOMR.addVar("rt.tstart", t_start);
			}
			if (typeof impl.navigationStart === "number" && impl.navigationStart !== t_start) {
				BOOMR.addVar("rt.nstart", impl.navigationStart);
			}
			if (typeof impl.t_start === "number" && impl.t_start !== t_start) {
				BOOMR.addVar("rt.cstart", impl.t_start);
			}
			BOOMR.addVar("rt.bstart", BOOMR.t_start);
			if (BOOMR.t_lstart) {
				BOOMR.addVar("rt.blstart", BOOMR.t_lstart);
			}
			BOOMR.addVar("rt.end", impl.timers.t_done.end);	// don't just use t_done because dev may have called endTimer before we did
		},

		/**
		 * Determines the best value to use for t_start.
		 * If called from an xhr call, then use the start time for that call
		 * Else, If we have navigation timing, use that
		 * Else, If we have a cookie time, and this isn't the result of a BACK button, use the cookie time
		 * Else, if we have a cached timestamp from an earlier call, use that
		 * Else, give up
		 *
		 * @param ename	The event name that resulted in this call. Special consideration for "xhr"
		 * @param data  Data passed in from the event caller. If the event name is "xhr",
		 *              this should contain the page group name for the xhr call in an attribute called `name`
		 *		and optionally, detailed timing information in a sub-object called `timing`
		 *              and resource information in a sub-object called `resource`
		 *
		 * @returns the determined value of t_start or undefined if unknown
		 */
		determineTStart: function(ename, data) {
			var t_start;
			if (ename === "xhr") {
				if (data && data.name && impl.timers[data.name]) {
					// For xhr timers, t_start is stored in impl.timers.xhr_{page group name}
					// and xhr.pg is set to {page group name}
					t_start = impl.timers[data.name].start;
				}
				else if (data && data.timing && data.timing.requestStart) {
					// For automatically instrumented xhr timers, we have detailed timing information
					t_start = data.timing.requestStart;
				}

				if (typeof t_start === "undefined" && data && BOOMR.utils.inArray(data.initiator, BOOMR.constants.BEACON_TYPE_SPAS)) {
					// if we don't have a start time, set to none so it can possibly be fixed up
					BOOMR.addVar("rt.start", "none");
				}
				else {
					BOOMR.addVar("rt.start", "manual");
				}

				impl.cached_xhr_start = t_start;
			}
			else {
				if (impl.navigationStart) {
					t_start = impl.navigationStart;
				}
				else if (impl.t_start && impl.navigationType !== 2) {
					t_start = impl.t_start;			// 2 is TYPE_BACK_FORWARD but the constant may not be defined across browsers
					BOOMR.addVar("rt.start", "cookie");	// if the user hit the back button, referrer will match, and cookie will match
				}						// but will have time of previous page start, so t_done will be wrong
				else if (impl.cached_t_start) {
					t_start = impl.cached_t_start;
				}
				else {
					BOOMR.addVar("rt.start", "none");
					t_start = undefined;			// force all timers to NaN state
				}

				impl.cached_t_start = t_start;
			}


			return t_start;
		},

		page_ready: function() {
			// we need onloadfired because it's possible to reset "impl.complete"
			// if you're measuring multiple xhr loads, but not possible to reset
			// impl.onloadfired
			this.onloadfired = true;
		},

		check_visibility: function() {
			// we care if the page became visible at some point
			if (BOOMR.visibilityState() === "visible") {
				impl.visiblefired = true;
			}
		},

		prerenderToVisible: function() {
			if (impl.onloadfired &&
			    impl.autorun) {


				// note that we transitioned from prerender on the beacon for debugging
				BOOMR.addVar("vis.pre", "1");

				// send a beacon
				BOOMR.plugins.RT.done(null, "visible");
			}
		},

		page_unload: function(edata) {

			if (!this.unloadfired) {
				// run done on abort or on page_unload to measure session length
				BOOMR.plugins.RT.done(edata, "unload");
			}

			//
			// Set cookie with r (the referrer) of this page, but only if the
			// browser doesn't support NavigationTiming.  The referrer is used
			// in non-NT browsers to decide if the "ul" or "hd" timestamps can
			// be used as the start of the navigation.  Don't set if strict_referrer
			// is disabled either.
			//
			// We use document.URL instead of location.href because of a bug in safari 4
			// where location.href is URL decoded
			//
			this.updateCookie(
				(!impl.navigationStart && impl.strict_referrer) ? {
					"r": BOOMR.utils.MD5(d.URL)
				} : null,
				edata.type === "beforeunload" ? "ul" : "hd"
			);

			this.unloadfired = true;
		},

		_iterable_click: function(name, element, etarget, value_cb) {
			var value;
			if (!etarget) {
				return;
			}

			while (etarget && etarget.nodeName && etarget.nodeName.toUpperCase() !== element) {
				etarget = etarget.parentNode;
			}
			if (etarget && etarget.nodeName && etarget.nodeName.toUpperCase() === element) {


				// we might need to reset the session first, as updateCookie()
				// below sets the lastActionTime
				this.refreshSession();
				this.maybeResetSession(BOOMR.now());

				// user event, they may be going to another page
				// if this page is being opened in a different tab, then
				// our unload handler won't fire, so we need to set our
				// cookie on click or submit
				value = value_cb(etarget);

				this.updateCookie(
					{
						"nu": BOOMR.utils.MD5(value)
					},
					"cl");

				BOOMR.addVar("nu", BOOMR.utils.cleanupURL(value));

				impl.addedVars.push("nu");
			}
		},

		onclick: function(etarget) {
			impl._iterable_click("Click", "A", etarget, function(t) { return t.href; });
		},

		markComplete: function() {
			if (this.onloadfired) {
				// allow error beacons to send outside of page load without adding
				// RT variables to the beacon
				impl.complete = true;
			}
		},

		onsubmit: function(etarget) {
			impl._iterable_click("Submit", "FORM", etarget, function(t) {
				var v = (typeof t.getAttribute === "function" && t.getAttribute("action")) || d.URL || "";
				return v.match(/\?/) ? v : v + "?";
			});
		},

		onconfig: function(config) {
			if (config.beacon_url) {
				impl.beacon_url = config.beacon_url;
			}

			if (config.RT) {
				if (config.RT.oboError && !isNaN(config.RT.oboError) && config.RT.oboError > impl.oboError) {
					impl.oboError = config.RT.oboError;
				}

				if (config.RT.loadTime && !isNaN(config.RT.loadTime) && config.RT.loadTime > impl.loadTime) {
					impl.loadTime = config.RT.loadTime;

					if (impl.timers.t_done && !isNaN(impl.timers.t_done.delta)) {
						impl.loadTime += impl.timers.t_done.delta;
					}
				}
			}
		},

		domloaded: function() {
			BOOMR.plugins.RT.endTimer("t_domloaded");
		},

		clear: function() {
			BOOMR.removeVar("rt.start");
			if (impl.addedVars && impl.addedVars.length > 0) {
				BOOMR.removeVar(impl.addedVars);
				impl.addedVars = [];
			}
		},

		spaNavigation: function() {
			// a SPA navigation occured, force onloadfired to true
			impl.onloadfired = true;
		}
	};

	BOOMR.plugins.RT = {
		/**
		 * Initializes the plugin.
		 *
		 * @param {object} config Configuration
		 * @param {string} [config.RT.cookie] The name of the cookie in which to store
		 * the start time for measuring page load time.
		 *
		 * The default name is `RT`.
		 *
		 * Set this to a falsy value to ignore cookies and depend completely on
		 * the NavigationTiming API for the start time.
		 * @param {string} [config.RT.cookie_exp] The lifetime in seconds of the roundtrip cookie.
		 *
		 * This only needs to live for as long as it takes for a single page to load.
		 *
		 * Something like 10 seconds or so should be good for most cases, but to be safe,
		 * and to cover people with really slow connections, or users that are geographically
		 * far away from you, keep it to a few minutes.
		 *
		 * The default is set to 10 minutes.
		 * @param {string} [config.RT.strict_referrer] By default, boomerang will not measure a
		 * page's roundtrip time if the URL in the RT cookie doesn't match the
		 * current page's `document.referrer`.
		 *
		 * This is because it generally means that the user visited a third page
		 * while their RT cookie was still valid, and this could render the page
		 * load time invalid.
		 *
		 * There may be cases, though, when this is a valid flow - for example,
		 * you have an SSL page in between and the referrer isn't passed through.
		 *
		 * In this case, you'll want to set `strict_referrer` to `false`.
		 *
		 * The default is `true.`
		 *
		 * @returns {@link BOOMR.plugins.RT} The RT plugin for chaining
		 * @memberof BOOMR.plugins.RT
		 */
		init: function(config) {

			if (w !== BOOMR.window) {
				w = BOOMR.window;
			}

			if (config && config.CrossDomain && config.CrossDomain.sending) {
				impl.crossdomain_sending = true;
			}

			// protect against undefined window/document
			if (!w || !w.document) {
				return;
			}

			d = w.document;

			BOOMR.utils.pluginConfig(impl, config, "RT",
						["cookie", "cookie_exp", "session_exp", "strict_referrer"]);

			if (config && typeof config.autorun !== "undefined") {
				impl.autorun = config.autorun;
			}

			// If we received a beacon URL from the server, we'll use it, unless of course
			// we already had a beacon URL, in which case we'll hold on to it until our session
			// expires, and then use it.
			// It's possible that a beacon collector dies while a session is active, and in that
			// case we might end up sending beacons to a blackhole until the next config.js
			// request tells us to force the new beacon url
			if (config && config.beacon_url) {
				if (!impl.beacon_url || config.force_beacon_url) {
					impl.beacon_url = config.beacon_url;
				}
				impl.next_beacon_url = config.beacon_url;
			}

			// A beacon may be fired automatically on page load or if the page dev fires
			// it manually with their own timers.  It may not always contain a referrer
			// (eg: XHR calls).  We set default values for these cases.
			// This is done before reading from the cookie because the cookie overwrites
			// impl.r
			if (typeof d !== "undefined") {
				impl.r = BOOMR.utils.hashQueryString(d.referrer, true);
			}

			// Now pull out start time information and session information from the cookie
			// We'll do this every time init is called, and every time we call it, it will
			// overwrite values already set (provided there are values to read out)
			impl.initFromCookie();

			// only initialize once.  we still collect config and check/set cookies
			// every time init is called, but we attach event handlers only once
			if (impl.initialized) {
				return this;
			}

			impl.complete = false;
			impl.timers = {};

			impl.check_visibility();

			BOOMR.subscribe("page_ready", impl.page_ready, null, impl);
			BOOMR.subscribe("visibility_changed", impl.check_visibility, null, impl);
			BOOMR.subscribe("prerender_to_visible", impl.prerenderToVisible, null, impl);
			BOOMR.subscribe("page_ready", this.done, "load", this);
			BOOMR.subscribe("xhr_load", this.done, "xhr", this);
			BOOMR.subscribe("dom_loaded", impl.domloaded, null, impl);
			BOOMR.subscribe("page_unload", impl.page_unload, null, impl);
			BOOMR.subscribe("click", impl.onclick, null, impl);
			BOOMR.subscribe("form_submit", impl.onsubmit, null, impl);
			BOOMR.subscribe("before_beacon", this.addTimersToBeacon, "beacon", this);
			BOOMR.subscribe("beacon", impl.clear, null, impl);
			BOOMR.subscribe("error", impl.markComplete, null, impl);
			BOOMR.subscribe("config", impl.onconfig, null, impl);
			BOOMR.subscribe("spa_navigation", impl.spaNavigation, null, impl);
			BOOMR.subscribe("interaction", impl.markComplete, null, impl);

			// Override any getBeaconURL method to make sure we return the one from the
			// cookie and not the one hardcoded into boomerang
			BOOMR.getBeaconURL = function() { return impl.beacon_url; };

			impl.initialized = true;
			return this;
		},

		/**
		 * Starts the timer named `timer_name`.
		 *
		 * Timers count in milliseconds.
		 *
		 * You must call {@link BOOMR.plugins.RT.endTimer} when this timer has
		 * completed for the measurement to be recorded in the beacon.
		 *
		 * If passed in, the optional second parameter `time_value` is the timestamp
		 * in milliseconds to set the timer's start time to. This is useful if you
		 * need to record a timer that started before boomerang was loaded.
		 *
		 * @param {string} timer_name The name of the timer to start
		 * @param {TimeStamp} [time_value] If set, the timer's start time will be
		 * set explicitly to this value. If not set, the current timestamp is used.
		 *
		 * @returns {@link BOOMR.plugins.RT} The RT plugin for chaining
		 * @memberof BOOMR.plugins.RT
		 */
		startTimer: function(timer_name, time_value) {
			if (timer_name) {
				if (timer_name === "t_page") {
					this.endTimer("t_resp", time_value);
				}
				impl.timers[timer_name] = {start: (typeof time_value === "number" ? time_value : BOOMR.now())};
			}

			return this;
		},

		/**
		 * Stops the timer named `timer_name`.
		 *
		 * It is not necessary for the timer to have been started before you call `endTimer()`.
		 *
		 * If a timer with this name was not started, then the unload time of the
		 * previous page is used instead. This allows you to measure the time across pages.
		 *
		 * @param {string} timer_name The name of the timer to start
		 * @param {TimeStamp} [time_value] If set, the timer's stop time will be
		 * set explicitly to this value. If not set, the current timestamp is used.
		 *
		 * @returns {@link BOOMR.plugins.RT} The RT plugin for chaining
		 * @memberof BOOMR.plugins.RT
		 */
		endTimer: function(timer_name, time_value) {
			if (timer_name) {
				impl.timers[timer_name] = impl.timers[timer_name] || {};
				if (impl.timers[timer_name].end === undefined) {
					impl.timers[timer_name].end =
							(typeof time_value === "number" ? time_value : BOOMR.now());
				}
			}

			return this;
		},

		/**
		 * Clears (removes) the specified timer
		 *
		 * @param {string} timer_name Timer name
		 * @memberof BOOMR.plugins.RT
		 */
		clearTimer: function(timer_name) {
			if (timer_name) {
				delete impl.timers[timer_name];
			}

			return this;
		},

		/**
		 * Sets the timer named `timer_name` to an explicit time measurement `time_value`.
		 *
		 * You'd use this method if you measured time values within your page before
		 * boomerang was loaded and now need to pass those values to the {@link BOOMR.plugins.RT}
		 * plugin for inclusion in the beacon.
		 *
		 * It is not necessary to call `startTimer()` or `endTimer()` before
		 * calling `setTimer()`.
		 *
		 * If you do, the old values will be ignored and the value passed in to
		 * this function will be used.
		 *
		 * @param {string} timer_name The name of the timer to start
		 * @param {number} time_value The value in milliseconds to set this timer to.
		 *
		 * @returns {@link BOOMR.plugins.RT} The RT plugin for chaining
		 * @memberof BOOMR.plugins.RT
		 */
		setTimer: function(timer_name, time_delta_or_start, timer_end) {
			if (timer_name) {
				if (typeof timer_end !== "undefined") {
					// in this case, we were given three args, the name, start, and end,
					// so time_delta_or_start is the start time
					impl.timers[timer_name] = {
						start: time_delta_or_start,
						end: timer_end,
						delta: timer_end - time_delta_or_start
					};
				}
				else {
					// in this case, we were just given two args, the name and delta
					impl.timers[timer_name] = { delta: time_delta_or_start };
				}
			}

			return this;
		},

		/**
		 * Adds all known timers to the beacon
		 *
		 * @param {object} vars (unused)
		 * @param {string} source Source
		 *
		 * @memberof BOOMR.plugins.RT
		 */
		addTimersToBeacon: function(vars, source) {
			var t_name, timer,
			    t_other = [];

			for (t_name in impl.timers) {
				if (impl.timers.hasOwnProperty(t_name)) {
					timer = impl.timers[t_name];

					// if delta is a number, then it was set using setTimer
					// if not, then we have to calculate it using start & end
					if (typeof timer.delta !== "number") {
						if (typeof timer.start !== "number") {
							timer.start = source === "xhr" ? impl.cached_xhr_start : impl.cached_t_start;
						}
						timer.delta = timer.end - timer.start;
					}

					// If the caller did not set a start time, and if there was no start cookie
					// Or if there was no end time for this timer,
					// then timer.delta will be NaN, in which case we discard it.
					if (isNaN(timer.delta)) {
						continue;
					}

					if (impl.basic_timers.hasOwnProperty(t_name)) {
						BOOMR.addVar(t_name, timer.delta);
						impl.addedVars.push(t_name);
					}
					else {
						t_other.push(t_name + "|" + timer.delta);
					}
				}
			}

			if (t_other.length) {
				BOOMR.addVar("t_other", t_other.join(","));
				impl.addedVars.push("t_other");
			}

			if (source === "beacon") {
				impl.timers = {};
				impl.complete = false;	// reset this state for the next call
			}
		},

		/**
		 * Called when the page has reached a "usable" state.  This may be when the
		 * `onload` event fires, or it could be at some other moment during/after page
		 * load when the page is usable by the user
		 *
		 * @param {object} edata Event data
		 * @param {string} ename Event name
		 *
		 * @returns {@link BOOMR.plugins.RT} The RT plugin for chaining
		 *
		 * @memberof BOOMR.plugins.RT
		 */
		done: function(edata, ename) {


			var t_start, t_done, t_now = BOOMR.now(),
			    subresource = false;

			// We may have to rerun if this was a pre-rendered page, so set complete to false, and only set to true when we're done
			impl.complete = false;

			t_done = impl.validateLoadTimestamp(t_now, edata, ename);

			if (ename === "load" || ename === "visible" || ename === "xhr") {
				if (!impl.setPageLoadTimers(ename, t_done, edata)) {
					return this;
				}
			}

			if (ename === "load" ||
			    ename === "visible" ||
			    (ename === "xhr" && edata && edata.initiator === "spa_hard")) {
				// Only add Boomerang timings to page load and SPA beacons
				impl.getBoomerangTimings();
			}

			t_start = impl.determineTStart(ename, edata);

			impl.refreshSession();

			impl.maybeResetSession(t_done, t_start);

			// If the dev has already called endTimer, then this call will do nothing
			// else, it will stop the page load timer
			this.endTimer("t_done", t_done);

			// For XHR events, ensure t_done is set with the proper start, end, and
			// delta timestamps.  Until Issue #195 is fixed, if this XHR is firing
			// a beacon very quickly after a previous XHR, the previous XHR might
			// not yet have had time to fire a beacon and clear its own t_done,
			// so the preceeding endTimer() wouldn't have set this XHR's timestamps.
			if (edata && edata.initiator === "xhr") {
				this.setTimer("t_done", edata.timing.requestStart, edata.timing.loadEventEnd);
			}

			// make sure old variables don't stick around
			BOOMR.removeVar(
				"t_done", "t_page", "t_resp", "t_postrender", "t_prerender", "t_load", "t_other",
				"rt.tstart", "rt.nstart", "rt.cstart", "rt.bstart", "rt.end", "rt.subres",
				"http.errno", "http.method", "http.type", "xhr.sync", "fetch.bnu",
				"rt.ss", "rt.sl", "rt.tt", "rt.lt"
			);

			impl.setSupportingTimestamps(t_start);

			this.addTimersToBeacon(null, ename);

			BOOMR.setReferrer(impl.r);

			if (ename === "xhr" && edata) {
				if (edata && edata.data) {
					edata = edata.data;
				}
			}

			if (ename === "xhr" && edata) {
				subresource = edata.subresource;

				if (edata.url) {
					BOOMR.addVar("u", BOOMR.utils.cleanupURL(edata.url.replace(/#.*/, "")));
					impl.addedVars.push("u");
				}

				if (edata.status && (edata.status < -1 || edata.status >= 400)) {
					BOOMR.addVar("http.errno", edata.status);
				}

				if (edata.method && edata.method !== "GET") {
					BOOMR.addVar("http.method", edata.method);
				}

				if (edata.type && edata.type !== "xhr") {
					BOOMR.addVar("http.type", edata.type[0]);  // just send first char
				}

				if (edata.headers) {
					BOOMR.addVar("http.hdr", edata.headers);
				}

				if (edata.synchronous) {
					BOOMR.addVar("xhr.sync", 1);
				}

				if (edata.initiator) {
					BOOMR.addVar("http.initiator", edata.initiator);
				}

				if (edata.responseBodyNotUsed) {
					BOOMR.addVar("fetch.bnu", 1);
				}

				impl.addedVars.push("http.errno", "http.method", "http.hdr", "xhr.sync", "http.initiator", "fetch.bnu");
			}

			// This is an explicit subresource
			if (subresource && subresource !== "passive") {
				BOOMR.addVar("rt.subres", 1);
				impl.addedVars.push("rt.subres");
			}

			// we're in onload
			if (ename === "load" || ename === "visible" ||
			    // xhr beacon and this is not a subresource
			    (ename === "xhr" && !subresource) ||
			    // unload fired before onload
			    (ename === "unload" && !impl.onloadfired && impl.autorun) && !impl.crossdomain_sending) {
				impl.incrementSessionDetails();

				// save a last-loaded timestamp in the cookie
				impl.updateCookie(null, "ld");
			}

			BOOMR.addVar({
				"rt.tt": impl.loadTime,
				"rt.obo": impl.oboError
			});

			impl.addedVars.push("rt.tt", "rt.obo");

			impl.updateCookie();

			if (ename === "unload") {
				BOOMR.addVar("rt.quit", "");

				if (!impl.onloadfired) {
					BOOMR.addVar("rt.abld", "");
					impl.addedVars.push("rt.abld");
				}

				if (!impl.visiblefired) {
					BOOMR.addVar("rt.ntvu", "");
				}
			}

			impl.complete = true;

			BOOMR.sendBeacon(impl.beacon_url);

			return this;
		},

		/**
		 * Whether or not this plugin is complete
		 *
		 * @returns {boolean} `true` if the plugin is complete
		 * @memberof BOOMR.plugins.RT
		 */
		is_complete: function(vars) {
			// allow error beacons to go through even if we're not complete
			return impl.complete || (vars && vars["http.initiator"] === "error");
		},

		/**
		 * Updates the RT cookie.
		 *
		 * @memberof BOOMR.plugins.RT
		 */
		updateCookie: function() {
			impl.updateCookie();
		},

		/**
		 * Gets RT cookie data from the cookie and returns it as an object.
		 *
		 * Also decompresses the cookie if it has been compressed.
		 *
		 * @returns {(RTCookie|false)} an object containing RT Cookie data or false if no cookie is available
		 *
		 * @memberof BOOMR.plugins.RT
		 */
		getCookie: function() {
			var subcookies, base, epoch;

			// Disable use of RT cookie by setting its name to a falsy value
			if (!impl.cookie) {
				return false;
			}

			subcookies = BOOMR.utils.getSubCookies(BOOMR.utils.getCookie(impl.cookie)) || {};

			// decompress or parse cookie
			if (subcookies) {
				if (subcookies.z & COOKIE_COMPRESSED_TIMESTAMPS) {
					// Timestamps and durations are compressed
					base = 36;
					epoch = parseInt(subcookies.ss || 0, 36);
				}
				else {
					// Not compressed
					base = 10;
					epoch = 0;
				}

				// ss (Session Start)
				subcookies.ss = parseInt(subcookies.ss || 0, base);

				// tt (Total Time), sl (Session Length) and obo (Off By One)
				subcookies.tt = parseInt(subcookies.tt || 0, base);
				subcookies.obo = parseInt(subcookies.obo || 0, base);
				subcookies.sl = parseInt(subcookies.sl || 0, base);

				// session expiry
				if (subcookies.se) {
					subcookies.se = parseInt(subcookies.se, base) || SESSION_EXP;
				}

				// ld, ul, cl, hd (timestamps)
				if (subcookies.ld) {
					subcookies.ld = epoch + parseInt(subcookies.ld, base);
				}

				if (subcookies.ul) {
					subcookies.ul = epoch + parseInt(subcookies.ul, base);
				}

				if (subcookies.cl) {
					subcookies.cl = epoch + parseInt(subcookies.cl, base);
				}

				if (subcookies.hd) {
					subcookies.hd = epoch + parseInt(subcookies.hd, base);
				}
			}

			return subcookies;
		},

		incrementSessionDetails: function() {
			impl.incrementSessionDetails();
		},

		/**
		 * Gets the Navigation Start time
		 *
		 * @returns {TimeStamp} Navigation start
		 *
		 * @memberof BOOMR.plugins.RT
		 */
		navigationStart: function() {
			if (!impl.navigationStart) {
				impl.initFromNavTiming();
			}
			return impl.navigationStart;
		}
	};

}(window));

// End of RT plugin


/*
 * Copyright (c), Buddy Brewer.
 */
/**
 * The Navigation Timing plugin collects performance metrics collected by modern
 * user agents that support the W3C [NavigationTiming]{@link http://www.w3.org/TR/navigation-timing/}
 * specification.
 *
 * This plugin also adds similar [ResourceTiming]{@link https://www.w3.org/TR/resource-timing-1/}
 * metrics for any XHR beacons.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Beacon Parameters
 *
 * All beacon parameters are prefixed with `nt_`.
 *
 * This plugin adds the following parameters to the beacon for Page Loads:
 *
 * * `nt_red_cnt`: `performance.navigation.redirectCount`
 * * `nt_nav_type`: `performance.navigation.type`
 * * `nt_nav_st`: `performance.timing.navigationStart`
 * * `nt_red_st`: `performance.timing.redirectStart`
 * * `nt_red_end`: `performance.timing.redirectEnd`
 * * `nt_fet_st`: `performance.timing.fetchStart`
 * * `nt_dns_st`: `performance.timing.domainLookupStart`
 * * `nt_dns_end`: `performance.timing.domainLookupEnd`
 * * `nt_con_st`: `performance.timing.connectStart`
 * * `nt_con_end`: `performance.timing.connectEnd`
 * * `nt_req_st`: `performance.timing.requestStart`
 * * `nt_res_st`: `performance.timing.responseStart`
 * * `nt_res_end`: `performance.timing.responseEnd`
 * * `nt_domloading`: `performance.timing.domLoading`
 * * `nt_domint`: `performance.timing.domInteractive`
 * * `nt_domcontloaded_st`: `performance.timing.domContentLoadedEventStart`
 * * `nt_domcontloaded_end`: `performance.timing.domContentLoadedEventEnd`
 * * `nt_domcomp`: `performance.timing.domComplete`
 * * `nt_load_st`: `performance.timing.loadEventStart`
 * * `nt_load_end`: `performance.timing.loadEventEnd`
 * * `nt_unload_st`: `performance.timing.unloadEventStart`
 * * `nt_unload_end`: `performance.timing.unloadEventEnd`
 * * `nt_ssl_st`: `performance.timing.secureConnectionStart`
 * * `nt_spdy`: `1` if page was loaded over SPDY, `0` otherwise.  Only available
 *   in Chrome when it _doesn't_ support NavigationTiming2.  If NavigationTiming2
 *   is supported, `nt_protocol` will be added instead.
 * * `nt_first_paint`: The time when the first paint happened. If the browser
 *   supports the Paint Timing API, this is the `first-paint` time in milliseconds
 *   since the epoch. Else, on Internet Explorer, this is the `msFirstPaint`
 *   value, in milliseconds since the epoch. On Chrome, this is using
 *   `loadTimes().firstPaintTime` and is converted from seconds.microseconds
 *   into milliseconds since the epoch.
 * * `nt_cinf`: Chrome `chrome.loadTimes().connectionInfo`.  Only available
 *   in Chrome when it _doesn't_ support NavigationTiming2.  If NavigationTiming2
 *   is supported, `nt_protocol` will be added instead.
 * * `nt_protocol`: NavigationTiming2's `nextHopProtocol`
 * * `nt_bad`: If we detected that any NavigationTiming metrics looked odd,
 *   such as `responseEnd` in the far future or `fetchStart` before `navigationStart`.
 * * `nt_worker_start`: NavigationTiming2 `workerStart`
 * * `nt_enc_size`: NavigationTiming2 `encodedBodySize`
 * * `nt_dec_size`: NavigationTiming2 `decodedBodySize`
 * * `nt_trn_size`: NavigationTiming2 `transferSize`
 *
 * For XHR beacons, the following parameters are added (via ResourceTiming):
 *
 * * `nt_red_st`: `redirectStart`
 * * `nt_red_end`: `redirectEnd`
 * * `nt_fet_st`: `fetchStart`
 * * `nt_dns_st`: `domainLookupStart`
 * * `nt_dns_end`: `domainLookupEnd`
 * * `nt_con_st`: `connectStart`
 * * `nt_con_end`: `connectEnd`
 * * `nt_req_st`: `requestStart`
 * * `nt_res_st`: `responseStart`
 * * `nt_res_end`: `responseEnd`
 * * `nt_load_st`: `loadEventStart`
 * * `nt_load_end`: `loadEventEnd`
 * * `nt_ssl_st`: `secureConnectionStart`
 *
 * @see {@link http://www.w3.org/TR/navigation-timing/}
 * @see {@link https://www.w3.org/TR/resource-timing-1/}
 * @class BOOMR.plugins.NavigationTiming
 */
(function() {



	if (BOOMR.plugins.NavigationTiming) {
		return;
	}

	/**
	 * Calculates a NavigationTiming timestamp for the beacon, in milliseconds
	 * since the Unix Epoch.
	 *
	 * The offset should be 0 if using a timestamp from performance.timing (which
	 * are already in milliseconds since Unix Epoch), or the value of navigationStart
	 * if using getEntriesByType("navigation") (which are DOMHighResTimestamps).
	 *
	 * The number is stripped of any decimals.
	 *
	 * @param {number} offset navigationStart offset (0 if using NavTiming1)
	 * @param {number} val DOMHighResTimestamp
	 *
	 * @returns {number} Timestamp for beacon
	 */
	function calcNavTimingTimestamp(offset, val) {
		if (typeof val !== "number" || val === 0) {
			return undefined;
		}

		return Math.floor((offset || 0) + val);
	}

	// A private object to encapsulate all your implementation details
	var impl = {
		complete: false,
		fullySent: false,
		sendBeacon: function() {
			this.complete = true;
			BOOMR.sendBeacon();
		},
		xhr_done: function(edata) {

			var p;

			if (edata && edata.initiator === "spa_hard") {
				// Single Page App - Hard refresh: Send page's NavigationTiming data, if
				// available.
			//BOOMR.plugins.xhrWatcher.pushHeader(BOOMR.plugins.convertTuna.getCookie("X-Scouter-Gxid"));
				BOOMR.plugins.xhrWatcher.pushHeader('spa_hard_done');
				impl.done(edata);
				return;
			}
			else if (edata && edata.initiator === "spa") {
				// Single Page App - Soft refresh: The original hard navigation is no longer
				// relevant for this soft refresh, nor is the "URL" for this page, so don't
				// add NavigationTiming or ResourceTiming metrics.
				BOOMR.plugins.xhrWatcher.pushHeader('spa_done');
				impl.sendBeacon();
				return;
			}

			var w = BOOMR.window, res, data = {}, k;

			if (!edata) {
				return;
			}

			if (edata.data) {
				edata = edata.data;
			}

			p = BOOMR.getPerformance();

			// if we previously saved the correct ResourceTiming entry, use it
			if (p && edata.restiming) {
				data = {
					// initiator: edata.initiator,
					// method: edata.method,
					// type: edata.type,
					// url: edata.url,
					nt_red_st: edata.restiming.redirectStart,
					nt_red_end: edata.restiming.redirectEnd,
					nt_fet_st: edata.restiming.fetchStart,
					nt_dns_st: edata.restiming.domainLookupStart,
					nt_dns_end: edata.restiming.domainLookupEnd,
					nt_con_st: edata.restiming.connectStart,
					nt_con_end: edata.restiming.connectEnd,
					nt_req_st: edata.restiming.requestStart,
					nt_res_st: edata.restiming.responseStart,
					nt_res_end: edata.restiming.responseEnd
				};

				if (edata.restiming.secureConnectionStart) {
					// secureConnectionStart is OPTIONAL in the spec
					data.nt_ssl_st = edata.restiming.secureConnectionStart;
				}

				for (k in data) {
					if (data.hasOwnProperty(k) && data[k]) {
						data[k] += p.timing.navigationStart;

						// don't need to send microseconds
						data[k] = Math.floor(data[k]);
					}
				}
			}

			if (edata.timing) {
				res = edata.timing;
				if (!data.nt_req_st) {
					// requestStart will be 0 if Timing-Allow-Origin header isn't set on the xhr response
					data.nt_req_st = res.requestStart;
				}
				if (!data.nt_res_st) {
					// responseStart will be 0 if Timing-Allow-Origin header isn't set on the xhr response
					data.nt_res_st = res.responseStart;
				}
				if (!data.nt_res_end) {
					data.nt_res_end = res.responseEnd;
				}
				data.nt_domint = res.domInteractive;
				data.nt_domcomp = res.domComplete;
				data.nt_load_st = res.loadEventEnd;
				data.nt_load_end = res.loadEventEnd;
			}

			for (k in data) {
				if (data.hasOwnProperty(k) && !data[k]) {
					delete data[k];
				}
			}

			// console.log('xhr done');
			// console.log(data.nt_res_end - data.nt_fet_st);

			BOOMR.addVar(data);

			try { impl.addedVars.push.apply(impl.addedVars, Object.keys(data)); }
			catch (ignore) { /* empty */ }

			impl.sendBeacon();
		},

		done: function() {

			// page load done, or tunajs insert done
			var w = BOOMR.window, p, pn, chromeTimes, pt, data = {}, offset = 0, i,
				paintTiming, paintTimingSupported = false, k;

			if (this.complete) {
				return this;
			}

			impl.addedVars = [];

			p = BOOMR.getPerformance();

			if (p) {
				if (typeof p.getEntriesByType === "function") {
					pt = p.getEntriesByType("navigation");
					if (pt && pt.length) {
						BOOMR.info("This user agent supports NavigationTiming2", "nt");

						pt = pt[0];

						// ensure DOMHighResTimestamps are added to navigationStart
						offset = p.timing ? p.timing.navigationStart : 0;
					}
					else {
						pt = undefined;
					}
				}

				if (!pt && p.timing) {
					BOOMR.info("This user agent supports NavigationTiming", "nt");
					pt = p.timing;
				}

				if (pt) {
					data = {
						// start is `navigationStart` on .timing, `startTime` is always 0 on timeline entry
						nt_nav_st: p.timing ? p.timing.navigationStart : 0,

						// all other entries have the same name on .timing vs timeline entry
						nt_red_st: calcNavTimingTimestamp(offset, pt.redirectStart),
						nt_red_end: calcNavTimingTimestamp(offset, pt.redirectEnd),
						nt_fet_st: calcNavTimingTimestamp(offset, pt.fetchStart),
						nt_dns_st: calcNavTimingTimestamp(offset, pt.domainLookupStart),
						nt_dns_end: calcNavTimingTimestamp(offset, pt.domainLookupEnd),
						nt_con_st: calcNavTimingTimestamp(offset, pt.connectStart),
						nt_con_end: calcNavTimingTimestamp(offset, pt.connectEnd),
						nt_req_st: calcNavTimingTimestamp(offset, pt.requestStart),
						nt_res_st: calcNavTimingTimestamp(offset, pt.responseStart),
						nt_res_end: calcNavTimingTimestamp(offset, pt.responseEnd),
						nt_domloading: calcNavTimingTimestamp(offset, pt.domLoading),
						nt_domint: calcNavTimingTimestamp(offset, pt.domInteractive),
						nt_domcontloaded_st: calcNavTimingTimestamp(offset, pt.domContentLoadedEventStart),
						nt_domcontloaded_end: calcNavTimingTimestamp(offset, pt.domContentLoadedEventEnd),
						nt_domcomp: calcNavTimingTimestamp(offset, pt.domComplete),
						nt_load_st: calcNavTimingTimestamp(offset, pt.loadEventStart),
						nt_load_end: calcNavTimingTimestamp(offset, pt.loadEventEnd),
						nt_unload_st: calcNavTimingTimestamp(offset, pt.unloadEventStart),
						nt_unload_end: calcNavTimingTimestamp(offset, pt.unloadEventEnd)
					};

					// domLoading doesn't exist on NavigationTiming2, so fetch it
					// from performance.timing if available.
					if (!data.nt_domloading && p && p.timing && p.timing.domLoading) {
						// value on performance.timing will be in Unix Epoch milliseconds
						data.nt_domloading = p.timing.domLoading;
					}

					if (pt.secureConnectionStart) {
						// secureConnectionStart is OPTIONAL in the spec
						data.nt_ssl_st = calcNavTimingTimestamp(offset, pt.secureConnectionStart);
					}

					if (p.timing && p.timing.msFirstPaint) {
						// msFirstPaint is IE9+ http://msdn.microsoft.com/en-us/library/ff974719
						// and is in Unix Epoch format
						data.nt_first_paint = p.timing.msFirstPaint;
					}

					if (pt.workerStart) {
						// ServiceWorker time
						data.nt_worker_start = calcNavTimingTimestamp(offset, pt.workerStart);
					}

					// Need to check both decodedSize and transferSize as
					// transferSize is 0 for cached responses and
					// decodedSize is 0 for empty responses (eg: beacons, 204s, etc.)
					if (pt.decodedBodySize || pt.transferSize) {
						data.nt_enc_size = pt.encodedBodySize;
						data.nt_dec_size = pt.decodedBodySize;
						data.nt_trn_size = pt.transferSize;
					}

					if (pt.nextHopProtocol) {
						data.nt_protocol = pt.nextHopProtocol;
					}
				}

				//
				// Get First Paint from Paint Timing API
				// https://www.w3.org/TR/paint-timing/
				//
				if (!data.nt_first_paint && BOOMR.plugins.PaintTiming) {
					paintTimingSupported = BOOMR.plugins.PaintTiming.is_supported();

					paintTiming = BOOMR.plugins.PaintTiming.getTimingFor("first-paint");

					if (paintTiming) {
						data.nt_first_paint = calcNavTimingTimestamp(offset, paintTiming);
					}
				}

				//
				// Chrome provides window.chrome.loadTimes(), but this is deprecated
				// in Chrome 64+ and will be removed at some point.  The data it
				// provides may be available in more modern performance APIs:
				//
				// * .connectionInfo (nt_cinf): Navigation Timing 2 nextHopProtocol
				// * .wasFetchedViaSpdy (nt_spdy): Could be calculated via above,
				//       so we don't need to add if it's not available directly
				// * .firstPaintTime (nt_first_paint): Paint Timing's first-paint
				//
				// If we've already queried that data, don't also query
				// loadTimes() as it will generate a console warning.
				//
				if ((!data.nt_protocol || !data.nt_first_paint) &&
				    (!pt || pt.nextHopProtocol !== "") &&
				    !paintTimingSupported &&
				    w.chrome &&
				    typeof w.chrome.loadTimes === "function") {
					chromeTimes = w.chrome.loadTimes();
					if (chromeTimes) {
						data.nt_spdy = (chromeTimes.wasFetchedViaSpdy ? 1 : 0);
						data.nt_cinf = chromeTimes.connectionInfo;

						// Chrome firstPaintTime is in seconds.microseconds, so
						// we need to multiply it by 1000 to be consistent with
						// msFirstPaint and other NavigationTiming timestamps that
						// are in milliseconds.microseconds.
						if (typeof chromeTimes.firstPaintTime === "number" && chromeTimes.firstPaintTime !== 0) {
							data.nt_first_paint = Math.round(chromeTimes.firstPaintTime * 1000);
						}
					}
				}

				//
				// Navigation Type and Redirect Count
				//
				if (p.navigation) {
					pn = p.navigation;

					data.nt_red_cnt  = pn.redirectCount;
					data.nt_nav_type = pn.type;
				}

				// Remove any properties that are undefined
				for (k in data) {
					if (data.hasOwnProperty(k) && data[k] === undefined) {
						delete data[k];
					}
				}

				BOOMR.addVar(data);

				//
				// Basic browser bug detection for known cases where NavigationTiming
				// timestamps might not be trusted.
				//
				if (pt && (
				    (pt.requestStart && pt.navigationStart && pt.requestStart < pt.navigationStart) ||
				    (pt.responseStart && pt.navigationStart && pt.responseStart < pt.navigationStart) ||
				    (pt.responseStart && pt.fetchStart && pt.responseStart < pt.fetchStart) ||
				    (pt.navigationStart && pt.fetchStart < pt.navigationStart) ||
				    (pt.responseEnd && pt.responseEnd > BOOMR.now() + 8.64e+7)
				)) {
					BOOMR.addVar("nt_bad", 1);
					impl.addedVars.push("nt_bad");
				}

				// ensure all vars are removed at beacon
				try {
					impl.addedVars.push.apply(impl.addedVars, Object.keys(data));
				}
				catch (ignore) {
					/* empty */
				}

				if (data.nt_load_end > 0) {
					this.fullySent = true;
				}
			}

			impl.sendBeacon();
		},

		clear: function() {
			if (impl.addedVars && impl.addedVars.length > 0) {
				BOOMR.removeVar(impl.addedVars);
				impl.addedVars = [];
			}
			// if we ever sent the full data, we're complete for all times
			this.complete = this.fullySent;
		},

		prerenderToVisible: function() {
			// ensure we add our data to the beacon even if we had added it
			// during prerender (in case another beacon went out in between)
			this.complete = false;

			// add our data to the beacon
			this.done();
		}
	};

	//
	// Exports
	//
	BOOMR.plugins.NavigationTiming = {
		/**
		 * Initializes the plugin.
		 *
		 * This plugin does not have any configuration.
		 * @returns {@link BOOMR.plugins.NavigationTiming} The NavigationTiming plugin for chaining
		 * @memberof BOOMR.plugins.NavigationTiming
		 */
		init: function() {
			if (!impl.initialized) {
				// we'll fire on whichever happens first
				BOOMR.subscribe("page_ready", impl.done, null, impl);
				BOOMR.subscribe("prerender_to_visible", impl.prerenderToVisible, null, impl);
				BOOMR.subscribe("xhr_load", impl.xhr_done, null, impl);
				BOOMR.subscribe("before_unload", impl.done, null, impl);
				BOOMR.subscribe("beacon", impl.clear, null, impl);

				impl.initialized = true;
			}
			return this;
		},

		/**
		 * Whether or not this plugin is complete
		 *
		 * @returns {boolean} `true` if the plugin is complete
		 * @memberof BOOMR.plugins.NavigationTiming
		 */
		is_complete: function() {
			return true;
		}
	};

}());

/**
 * Plugin to collect metrics from the W3C [ResourceTiming]{@link http://www.w3.org/TR/resource-timing/}
 * API.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Beacon Parameters
 *
 * This plugin adds the following parameters to the beacon for Page Loads:
 *
 * * `restiming`: Compressed ResourceTiming data
 *
 * The ResourceTiming plugin adds an object named `restiming` to the beacon data.
 *
 *  `restiming` is an optimized [Trie]{@link http://en.wikipedia.org/wiki/Trie} structure,
 * where the keys are the ResourceTiming URLs, and the values correspond to those URLs'
 * [PerformanceResourceTiming]{@link http://www.w3.org/TR/resource-timing/#performanceresourcetiming}
 * timestamps:
 *
 *     { "[url]": "[data]"}
 *
 * The Trie structure is used to minimize the data transmitted from the ResourceTimings.
 *
 * Keys in the Trie are the ResourceTiming URLs. For example, with a root page and three resources:
 *
 * * http://abc.com/
 * * http://abc.com/js/foo.js
 * * http://abc.com/css/foo.css
 * * http://abc.com/css/foo.png (downloaded twice)
 *
 * Then the Trie might look like this:
 *
 *     // Example 1
 *     {
 *       "http://abc.com/":
 *       {
 *         "|": "0,2",
 *         "js/foo.js": "3a,1",
 *         "css/": {
 *           "foo.css": "2b,2",
 *           "foo.png": "1c,3|1d,a"
 *         }
 *       }
 *     }
 *
 * If a resource's URL is a prefix of another resource, then it terminates with a
 * pipe symbol (`|`). In Example 1, `http://abc.com` (the root page) is a
 * prefix of `http://abc.com/js/foo.js`, so it is listed as `http://abc.com|` in
 * the Trie.
 *
 * If there is more than one ResourceTiming entry for a URL, each entry is
 * separated by a pipe symbol (`|`) in the `data`. In Example 1 above, `foo.png`
 * has been downloaded twice, so it is listed with two separate page loads, `1c,3` and `1d,a`.
 *
 * The value of each key is a string, which contains the following components:
 *
 *     data = "[initiatorType][timings]"
 *
 * `initiatorType` is a simple map from the PerformanceResourceTiming
 * `initiatorType` (which is a string) to an integer, according to the
 * {@link BOOMR.plugins.ResourceTiming.INITAITOR_TYPES} enum.
 *
 * `timings` is a string of [Base-36]{@link http://en.wikipedia.org/wiki/Base_36}
 * encoded timestamps from the PerformanceResourceTiming interface. The values in
 * the string are separated by commas:
 *
 *     timings = "[startTime],[responseEnd],[responseStart],[requestStart],[connectEnd],[secureConnectionStart],[connectStart],[domainLookupEnd],[domainLookupStart],[redirectEnd],[redirectStart]"
 *
 * `startTime` is a [DOMHighResTimeStamp]{@link http://www.w3.org/TR/hr-time/#domhighrestimestamp}
 * from when the resource started (Base 36).
 *
 * All other timestamps are offsets (rounded to milliseconds) from `startTime`
 * (Base 36). For example, `responseEnd` is calculated as:
 *
 *     responseEnd: base36(round(responseEnd - startTime))
 *
 * If the resulting timestamp is `0`, it is replaced with an empty string (`""`).
 *
 * All trailing commas are removed from the final string. This compresses the timing
 * string from timestamps that are often `0`. For example, here is what a fully-redirected
 * resource might look like:
 *
 *     { "http://abc.com/this-resource-was-redirected": "01,1,1,1,1,1,1,1,1,1,1" }
 *
 * While a resource that was loaded from the cache (and thus only has `startTime`
 * and `responseEnd` timestamps) might look like this:
 *
 *     { "http://abc.com/this-resource-was-redirected": "01,1" }
 *
 * Note that some of the metrics are restricted and will not be provided cross-origin
 * unless the Timing-Allow-Origin header permits.
 *
 * Putting this all together, let's look at `http://abc.com/css/foo.png` in Example 1.
 * We find it was downloaded twice `"1c,3|1d,a"`:
 *
 * * 1c,3:
 *     * `1`: `initiatorType` = `1` (IMG)
 *     * `c`: `startTime` = `c` (12ms)
 *     * `3`: `responseEnd` = `3` (3ms from startTime, or at 15ms)
 * * 1d,a:
 *     * `1`: `initiatorType` = `1` (IMG)
 *     * `d`: `startTime` = `d` (13ms)
 *     * `2`: `responseEnd` = `a` (10ms from startTime, or at 23ms)
 *
 * @see {@link http://www.w3.org/TR/resource-timing/}
 * @class BOOMR.plugins.ResourceTiming
 */
(function() {
	var impl;




	if (BOOMR.plugins.ResourceTiming) {
		return;
	}

	//
	// Constants
	//

	/**
	 * @enum {number}
	 * @memberof BOOMR.plugins.ResourceTiming
	 */
	var INITIATOR_TYPES = {
		/** Unknown type */
		"other": 0,
		/** IMG element (or IMAGE element inside a SVG for IE, Edge and Firefox) */
		"img": 1,
		/** LINK element (i.e. CSS) */
		"link": 2,
		/** SCRIPT element */
		"script": 3,
		/** Resource referenced in CSS */
		"css": 4,
		/** XMLHttpRequest */
		"xmlhttprequest": 5,
		/** The root HTML page itself */
		"html": 6,
		/** IMAGE element inside a SVG */
		"image": 7,
		/** [sendBeacon]{@link https://developer.mozilla.org/en-US/docs/Web/API/Navigator/sendBeacon} */
		"beacon": 8,
		/** [Fetch API]{@link https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API} */
		"fetch": 9,
		/** An IFRAME */
		"iframe": "a",
		/** IE11 and Edge (some versions) send "subdocument" instead of "iframe" */
		"subdocument": "a"
	};

	/**
	 * These are the only `rel` types that might be reference-able from
	 * ResourceTiming.
	 *
	 * https://html.spec.whatwg.org/multipage/links.html#linkTypes
	 *
	 * @enum {number}
	 * @memberof BOOMR.plugins.ResourceTiming
	 */
	var REL_TYPES = {
		"prefetch": 1,
		"preload": 2,
		"prerender": 3,
		"stylesheet": 4
	};

	var RT_FIELDS_TIMESTAMPS = [
		"startTime",
		"redirectStart",
		"redirectEnd",
		"fetchStart",
		"domainLookupStart",
		"domainLookupEnd",
		"connectStart",
		"secureConnectionStart",
		"connectEnd",
		"requestStart",
		"responseStart",
		"responseEnd",
		"workerStart"
	];

	// Words that will be broken (by ensuring the optimized trie doesn't contain
	// the whole string) in URLs, to ensure NoScript doesn't think this is an XSS attack
	var DEFAULT_XSS_BREAK_WORDS = [
		/(h)(ref)/gi,
		/(s)(rc)/gi,
		/(a)(ction)/gi
	];

	// Delimiter to use to break a XSS word
	var XSS_BREAK_DELIM = "\n";

	// Maximum number of characters in a URL
	var DEFAULT_URL_LIMIT = 500;

	// Any ResourceTiming data time that starts with this character is not a time,
	// but something else (like dimension data)
	var SPECIAL_DATA_PREFIX = "*";

	// Dimension data special type
	var SPECIAL_DATA_DIMENSION_TYPE = "0";

	// Dimension data special type
	var SPECIAL_DATA_SIZE_TYPE = "1";

	// Script attributes
	var SPECIAL_DATA_SCRIPT_ATTR_TYPE = "2";
	// The following make up a bitmask
	var ASYNC_ATTR = 0x1;
	var DEFER_ATTR = 0x2;
	var LOCAT_ATTR = 0x4;	// 0 => HEAD, 1 => BODY

	// Dimension data special type
	var SPECIAL_DATA_SERVERTIMING_TYPE = "3";

	// Link attributes
	var SPECIAL_DATA_LINK_ATTR_TYPE = "4";

	// Namespaced data
	var SPECIAL_DATA_NAMESPACED_TYPE = "5";

	/**
	 * Converts entries to a Trie (`splitAtPath=true`) or Radix
	 * Trie (`splitAtPath=false`):
	 * https://en.wikipedia.org/wiki/Trie
	 * https://en.wikipedia.org/wiki/Radix_tree
	 *
	 * Assumptions:
	 * 1) All entries have unique keys
	 * 2) Keys cannot have "|" in their name.
	 * 3) All key's values are strings
	 *
	 * Leaf nodes in the tree are the key's values.
	 *
	 * If key A is a prefix to key B, key A will be suffixed with "|".
	 *
	 * By default, the Trie is constructed "perfectly" (a Radix Trie) by looking
	 * at every letter of each URL.  If `splitAtPath` is specified, the URL is
	 * split up into groups based on the path separator. This will create a
	 * non-optimal Trie but will speed up the Trie construction significantly
	 * (taking less than a half or third of the time on large data sets).
	 *
	 * @param {object} entries Performance entries
	 * @param {boolean} [splitAtPath] Whether to split at path separator vs every character
	 *
	 * @returns {object} A trie
	 */
	function convertToTrie(entries, splitAtPath) {
		var trie = {}, url, urlFixed, i, value, letters, letter, cur, node;

		/**
		 * Builds an array of path components.
		 *
		 * @param {number} addSlashUntil Length of path components
		 */
		function splitUrlPaths(addSlashUntil) {
			return function(accumulator, currentValue, currentIndex) {
				var parts, j;

				// if this component has the XSS_BREAK_DELIM character in it, we need
				// to break it up
				if (currentValue.indexOf(XSS_BREAK_DELIM) !== -1) {
					// break at that character
					parts = currentValue.split(XSS_BREAK_DELIM);

					// add everything but the last one with special XSS_BREAK_DELIM nodes
					for (j = 0; j < parts.length - 1; j++) {
						// add this component
						accumulator.push(parts[j]);

						// add back in the XSS_BREAK_DELIM
						accumulator.push(XSS_BREAK_DELIM);
					}

					// add the last part
					currentValue = parts.slice(-1);
				}

				// add a '/' for everything but the last one
				if (typeof addSlashUntil === "number" && currentIndex < addSlashUntil) {
					currentValue += "/";
				}

				return accumulator.concat(currentValue);
			};
		}

		for (url in entries) {
			urlFixed = url;

			// find any strings to break
			for (i = 0; i < impl.xssBreakWords.length; i++) {
				// Add a XSS_BREAK_DELIM character after the first letter.  optimizeTrie will
				// ensure this sequence doesn't get combined.
				urlFixed = urlFixed.replace(impl.xssBreakWords[i], "$1" + XSS_BREAK_DELIM + "$2");
			}

			if (!entries.hasOwnProperty(url)) {
				continue;
			}

			value = entries[url];

			if (splitAtPath) {
				//
				// Split the Trie based on the path (less CPU, less optimial result)
				//
				letters = urlFixed.split("/");

				letters = [
					// protocol
					letters[0] + "//",

					// hostname and optional slash
					letters[2] + (letters.length > 3 ? "/" : "")

				// all of the path parts
				].concat(letters.slice(3).reduce(splitUrlPaths(letters.length - 4), []));
			}
			else {
				//
				// Split at every letter (more CPU, perfect result)
				//
				letters = urlFixed.split("");
			}

			// start at the top of the Trie
			cur = trie;

			for (i = 0; i < letters.length; i++) {
				letter = letters[i];
				node = cur[letter];

				if (typeof node === "undefined") {
					// nothing exists yet, create either a leaf if this is the end of the word,
					// or a branch if there are letters to go
					cur = cur[letter] = (i === (letters.length - 1) ? value : {});
				}
				else if (typeof node === "string") {
					// this is a leaf, but we need to go further, so convert it into a branch
					cur = cur[letter] = { "|": node };
				}
				else {
					if (i === (letters.length - 1)) {
						// this is the end of our key, and we've hit an existing node.  Add our timings.
						cur[letter]["|"] = value;
					}
					else {
						// continue onwards
						cur = cur[letter];
					}
				}
			}
		}

		return trie;
	}

	/**
	 * Optimize the Trie by combining branches with no leaf
	 *
	 * @param {object} cur Current Trie branch
	 * @param {boolean} top Whether or not this is the root node
	 *
	 * @returns {object} Optimized Trie
	 */
	function optimizeTrie(cur, top) {
		var num = 0, node, ret, topNode;

		// capture trie keys first as we'll be modifying it
		var keys = [];

		for (node in cur) {
			if (cur.hasOwnProperty(node)) {
				keys.push(node);
			}
		}

		for (var i = 0; i < keys.length; i++) {
			node = keys[i];
			if (typeof cur[node] === "object") {
				// optimize children
				ret = optimizeTrie(cur[node], false);
				if (ret) {
					// swap the current leaf with compressed one
					delete cur[node];

					if (node === XSS_BREAK_DELIM) {
						// If this node is a newline, which can't be in a regular URL,
						// it's due to the XSS patch.  Remove the placeholder character,
						// and make sure this node isn't compressed by incrementing
						// num to be greater than one.
						node = ret.name;
						num++;
					}
					else {
						node = node + ret.name;
					}
					cur[node] = ret.value;
				}
			}
			num++;
		}

		if (num === 1) {
			// compress single leafs
			if (top) {
				// top node gets special treatment so we're not left with a {node:,value:} at top
				topNode = {};
				topNode[node] = cur[node];
				return topNode;
			}
			else {
				// other nodes we return name and value separately
				return { name: node, value: cur[node] };
			}
		}
		else if (top) {
			// top node with more than 1 child, return it as-is
			return cur;
		}
		else {
			// more than two nodes and not the top, we can't compress any more
			return false;
		}
	}

	/**
	 * Trims the timing, returning an offset from the startTime in ms
	 *
	 * @param {number} time Time
	 * @param {number} startTime Start time
	 * @returns {number} Number of ms from start time
	 */
	function trimTiming(time, startTime) {
		if (typeof time !== "number") {
			time = 0;
		}

		if (typeof startTime !== "number") {
			startTime = 0;
		}

		// strip from microseconds to milliseconds only
		var timeMs = Math.round(time ? time : 0),
		    startTimeMs = Math.round(startTime ? startTime : 0);

		return timeMs === 0 ? 0 : (timeMs - startTimeMs);
	}

	/**
	 * Checks if the current execution context can access the specified frame.
	 *
	 * Note: In Safari, this will still produce a console error message, even
	 * though the exception is caught.

	 * @param {Window} frame The frame to check if access can haz
	 * @returns {boolean} true if true, false otherwise
	 */
	function isFrameAccessible(frame) {
		var dummy;

		try {
			// Try to access location.href first to trigger any Cross-Origin
			// warnings.  There's also a bug in Chrome ~48 that might cause
			// the browser to crash if accessing X-O frame.performance.
			// https://code.google.com/p/chromium/issues/detail?id=585871
			// This variable is not otherwise used.
			dummy = frame.location && frame.location.href;

			// Try to access frame.document to trigger X-O exceptions with that
			dummy = frame.document;

			if (("performance" in frame) && frame.performance) {
				return true;
			}
		}
		catch (e) {
			// empty
		}

		return false;
	}

	/**
	 * Attempts to get the navigationStart time for a frame.
	 * @returns navigationStart time, or 0 if not accessible
	 */
	function getNavStartTime(frame) {
		var navStart = 0;

		if (isFrameAccessible(frame) && frame.performance.timing && frame.performance.timing.navigationStart) {
			navStart = frame.performance.timing.navigationStart;
		}

		return navStart;
	}

	/**
	 * Gets all of the performance entries for a frame and its subframes
	 *
	 * @param {Frame} frame Frame
	 * @param {boolean} top This is the top window
	 * @param {string} offset Offset in timing from root IFRAME
	 * @param {number} depth Recursion depth
	 * @param {number[]} [frameDims] position and size of the frame if it is visible as returned by getVisibleEntries
	 * @returns {PerformanceEntry[]} Performance entries
	 */
	function findPerformanceEntriesForFrame(frame, isTopWindow, offset, depth, frameDims) {
		var entries = [], i, navEntries, navStart, frameNavStart, frameOffset, subFrames, subFrameDims,
		    navEntry, t, rtEntry, visibleEntries, scripts = {}, links = {}, a;

		if (typeof isTopWindow === "undefined") {
			isTopWindow = true;
		}

		if (typeof offset === "undefined") {
			offset = 0;
		}

		if (typeof depth === "undefined") {
			depth = 0;
		}

		if (depth > 10) {
			return entries;
		}

		try {
			if (!isFrameAccessible(frame)) {
				return entries;
			}

			navStart = getNavStartTime(frame);

			// gather visible entries on the page
			visibleEntries = getVisibleEntries(frame, frameDims);

			a = frame.document.createElement("a");

			// get all scripts as an object keyed on script.src
			collectResources(a, scripts, "script");
			collectResources(a, links, "link");

			subFrames = frame.document.getElementsByTagName("iframe");

			// get sub-frames' entries first
			if (subFrames && subFrames.length) {
				for (i = 0; i < subFrames.length; i++) {
					frameNavStart = getNavStartTime(subFrames[i].contentWindow);
					frameOffset = 0;
					if (frameNavStart > navStart) {
						frameOffset = offset + (frameNavStart - navStart);
					}

					a.href = subFrames[i].src;	// Get canonical URL

					entries = entries.concat(findPerformanceEntriesForFrame(subFrames[i].contentWindow, false, frameOffset, depth + 1, visibleEntries[a.href]));
				}
			}

			if (typeof frame.performance.getEntriesByType !== "function") {
				return entries;
			}

			function readServerTiming(entry) {
				return (impl.serverTiming && entry.serverTiming) || [];
			}

			// add an entry for the top page
			if (isTopWindow) {
				navEntries = frame.performance.getEntriesByType("navigation");
				if (navEntries && navEntries.length === 1) {
					navEntry = navEntries[0];

					// replace document with the actual URL
					entries.push({
						name: frame.location.href,
						startTime: 0,
						initiatorType: "html",
						redirectStart: navEntry.redirectStart,
						redirectEnd: navEntry.redirectEnd,
						fetchStart: navEntry.fetchStart,
						domainLookupStart: navEntry.domainLookupStart,
						domainLookupEnd: navEntry.domainLookupEnd,
						connectStart: navEntry.connectStart,
						secureConnectionStart: navEntry.secureConnectionStart,
						connectEnd: navEntry.connectEnd,
						requestStart: navEntry.requestStart,
						responseStart: navEntry.responseStart,
						responseEnd: navEntry.responseEnd,
						workerStart: navEntry.workerStart,
						encodedBodySize: navEntry.encodedBodySize,
						decodedBodySize: navEntry.decodedBodySize,
						transferSize: navEntry.transferSize,
						serverTiming: readServerTiming(navEntry)
					});
				}
				else if (frame.performance.timing) {
					// add a fake entry from the timing object
					t = frame.performance.timing;

					//
					// Avoid browser bugs:
					// 1. navigationStart being 0 in some cases
					// 2. responseEnd being ~2x what navigationStart is
					//    (ensure the end is within 60 minutes of start)
					//
					if (t.navigationStart !== 0 &&
						t.responseEnd <= (t.navigationStart + (60 * 60 * 1000))) {
						entries.push({
							name: frame.location.href,
							startTime: 0,
							initiatorType: "html",
							redirectStart: t.redirectStart ? (t.redirectStart - t.navigationStart) : 0,
							redirectEnd: t.redirectEnd ? (t.redirectEnd - t.navigationStart) : 0,
							fetchStart: t.fetchStart ? (t.fetchStart - t.navigationStart) : 0,
							domainLookupStart: t.domainLookupStart ? (t.domainLookupStart - t.navigationStart) : 0,
							domainLookupEnd: t.domainLookupEnd ? (t.domainLookupEnd - t.navigationStart) : 0,
							connectStart: t.connectStart ? (t.connectStart - t.navigationStart) : 0,
							secureConnectionStart: t.secureConnectionStart ? (t.secureConnectionStart - t.navigationStart) : 0,
							connectEnd: t.connectEnd ? (t.connectEnd - t.navigationStart) : 0,
							requestStart: t.requestStart ? (t.requestStart - t.navigationStart) : 0,
							responseStart: t.responseStart ? (t.responseStart - t.navigationStart) : 0,
							responseEnd: t.responseEnd ? (t.responseEnd - t.navigationStart) : 0
						});
					}
				}
			}

			// offset all of the entries by the specified offset for this frame
			var frameEntries = frame.performance.getEntriesByType("resource"),
			    frameFixedEntries = [];
			if (frame === BOOMR.window && impl.collectedEntries) {
				Array.prototype.push.apply(frameEntries, impl.collectedEntries);
				impl.collectedEntries = [];
			}

			for (i = 0; frameEntries && i < frameEntries.length; i++) {
				t = frameEntries[i];
				rtEntry = {
					name: t.name,
					initiatorType: t.initiatorType,
					encodedBodySize: t.encodedBodySize,
					decodedBodySize: t.decodedBodySize,
					transferSize: t.transferSize,
					serverTiming: readServerTiming(t),
					visibleDimensions: visibleEntries[t.name],
					latestTime: getResourceLatestTime(t)
				};
				for (var field = 0; field < RT_FIELDS_TIMESTAMPS.length; field++) {
					var key = RT_FIELDS_TIMESTAMPS[field];
					rtEntry[key] = ((key === "startTime") || t[key]) ? (t[key] + offset) : 0;
				}

				if (t.hasOwnProperty("_data")) {
					rtEntry._data = t._data;
				}

				// If this is a script, set its flags
				if ((t.initiatorType === "script" || t.initiatorType === "link") && scripts[t.name]) {
					var s = scripts[t.name];

					// Add async & defer based on attribute values
					rtEntry.scriptAttrs = (s.async ? ASYNC_ATTR : 0) | (s.defer ? DEFER_ATTR : 0);

					while (s.nodeType === 1 && s.nodeName !== "BODY") {
						s = s.parentNode;
					}

					// Add location by traversing up the tree until we either hit BODY or document
					rtEntry.scriptAttrs |= (s.nodeName === "BODY" ? LOCAT_ATTR : 0);
				}

				// If this is a link, set its flags
				if (t.initiatorType === "link" && links[t.name]) {
					// split on ASCII whitespace
					BOOMR.utils.arrayFind(links[t.name].rel.split(/[\u0009\u000A\u000C\u000D\u0020]+/), function(rel) { //eslint-disable-line no-loop-func
						// `rel`s are case insensitive
						rel = rel.toLowerCase();

						// only report the `rel` if it's from the known list
						if (REL_TYPES[rel]) {
							rtEntry.linkAttrs = REL_TYPES[rel];
							return true;
						}
					});
				}

				frameFixedEntries.push(rtEntry);
			}

			entries = entries.concat(frameFixedEntries);
		}
		catch (e) {
			return entries;
		}

		return entries;
	}

	/**
	 * Collect external resources by tagName
	 *
	 * @param {Element} a an anchor element
	 * @param {Object} obj object of resources where the key is the url
	 * @param {string} tagName tag name to collect
	 */
	function collectResources(a, obj, tagName) {
		Array.prototype
			.forEach
			.call(a.ownerDocument.getElementsByTagName(tagName), function(r) {
				// Get canonical URL
				a.href = r.currentSrc ||
					r.src ||
					(typeof r.getAttribute === "function" && r.getAttribute("xlink:href")) ||
					r.href;

				// only get external resource
				if (a.href.match(/^https?:\/\//)) {
					obj[a.href] = r;
				}
			});
	}

	/**
	 * Converts a number to base-36.
	 *
	 * If not a number or a string, or === 0, return "". This is to facilitate
	 * compression in the timing array, where "blanks" or 0s show as a series
	 * of trailing ",,,," that can be trimmed.
	 *
	 * If a string, return a string.
	 *
	 * @param {number} n Number
	 * @returns {string} Base-36 number, empty string, or string
	 */
	function toBase36(n) {
		return (typeof n === "number" && n !== 0) ?
			n.toString(36) :
			(typeof n === "string" ? n : "");
	}

	/**
	 * Finds all remote resources in the selected window that are visible, and returns an object
	 * keyed by the url with an array of height,width,top,left as the value
	 *
	 * @param {Window} win Window to search
	 * @param {number[]} [winDims] position and size of the window if it is an embedded iframe in the format returned by this function
	 * @returns {Object} Object with URLs of visible assets as keys, and Array[height, width, top, left, naturalHeight, naturalWidth] as value
	 */
	function getVisibleEntries(win, winDims) {
		// lower-case tag names should be used: https://developer.mozilla.org/en-US/docs/Web/API/Element/getElementsByTagName
		var els = ["img", "iframe", "image"], entries = {}, x, y, doc = win.document, a = doc.createElement("A");

		winDims = winDims || [0, 0, 0, 0];

		// https://developer.mozilla.org/en-US/docs/Web/API/Window/scrollX
		// https://developer.mozilla.org/en-US/docs/Web/API/Element/getBoundingClientRect
		x = winDims[3] + (win.pageXOffset !== undefined) ? win.pageXOffset : (doc.documentElement || doc.body.parentNode || doc.body).scrollLeft;
		y = winDims[2] + (win.pageYOffset !== undefined) ? win.pageYOffset : (doc.documentElement || doc.body.parentNode || doc.body).scrollTop;

		// look at each IMG and IFRAME
		els.forEach(function(elname) {
			var elements = doc.getElementsByTagName(elname), el, i, rect, src;

			for (i = 0; i < elements.length; i++) {
				el = elements[i];

				if (!el) {
					continue;
				}

				// look at this element if it has a src attribute or xlink:href, and we haven't already looked at it
				// currentSrc = IMG inside a PICTURE element or IMG srcset
				// src = IMG, IFRAME
				// xlink:href = svg:IMAGE
				src = el.currentSrc ||
					el.src ||
					(typeof el.getAttribute === "function" &&
						(el.getAttribute("src")) || el.getAttribute("xlink:href"));

				// make src absolute
				a.href = src;
				src = a.href;

				if (!src || entries[src]) {
					continue;
				}

				rect = el.getBoundingClientRect();

				// Require both height & width to be non-zero
				// IE <= 8 does not report rect.height/rect.width so we need offsetHeight & width
				if ((rect.height || el.offsetHeight) && (rect.width || el.offsetWidth)) {
					entries[src] = [
						rect.height || el.offsetHeight,
						rect.width || el.offsetWidth,
						Math.round(rect.top + y),
						Math.round(rect.left + x)
					];

					// If this is an image, it has a naturalHeight & naturalWidth
					// if these are different from its display height and width, we should report that
					// because it indicates scaling in HTML
					if (!el.naturalHeight && !el.naturalWidth) {
						continue;
					}

					// If the image came from a srcset, then the naturalHeight/Width will be density corrected.
					// We get the actual physical dimensions by assigning the image to an uncorrected Image object.
					// This should load from in-memory cache, so there should be no extra load.
					var realImg, nH, nW;

					if (el.currentSrc && (el.srcset || (el.parentNode && el.parentNode.nodeName && el.parentNode.nodeName.toUpperCase() === "PICTURE"))) {
						// We need to create this Image in the window that contains the element, and not
						// the boomerang window.
						realImg = el.isConnected ? el.ownerDocument.createElement("IMG") : new BOOMR.window.Image();
						realImg.src = src;
					}
					else {
						realImg = el;
					}

					nH = realImg.naturalHeight || el.naturalHeight;
					nW = realImg.naturalWidth  || el.naturalWidth;

					if ((nH || nW) && (entries[src][0] !== nH || entries[src][1] !== nW)) {
						entries[src].push(nH, nW);
					}
				}
			}
		});

		return entries;
	}

	/**
	 * Gathers a filtered list of performance entries.
	 *
	 * @param {number} from Only get timings from
	 * @param {number} to Only get timings up to
	 * @param {string[]} initiatorTypes Array of initiator types
	 *
	 * @returns {ResourceTiming[]} Matching ResourceTiming entries
	 * @memberof BOOMR.plugins.ResourceTiming
	 */
	function getFilteredResourceTiming(from, to, initiatorTypes) {
		var entries = findPerformanceEntriesForFrame(BOOMR.window, true, 0, 0),
		    i, e,
		    navStart = getNavStartTime(BOOMR.window), countCollector = {};

		if (!entries || !entries.length) {
			return {
				entries: []
			};
		}

		// sort entries by start time
		entries.sort(function(a, b) {
			return a.startTime - b.startTime;
		});

		var filteredEntries = [];
		for (i = 0; i < entries.length; i++) {
			e = entries[i];

			// skip non-resource URLs
			if (e.name.indexOf("http:") !== 0 &&
			    e.name.indexOf("https:") !== 0) {
				continue;
			}

			// skip boomerang.js and config URLs
			if (e.name.indexOf(BOOMR.url) > -1 ||
			    e.name.indexOf(BOOMR.config_url) > -1 ||
			    (typeof BOOMR.getBeaconURL === "function" && BOOMR.getBeaconURL() && e.name.indexOf(BOOMR.getBeaconURL()) > -1)) {
				continue;
			}

			// if the user specified a "from" time, skip resources that started before then
			if (from && (navStart + e.startTime) < from) {
				continue;
			}

			// if we were given a final timestamp, don't add any resources that started after it
			if (to && (navStart + e.startTime) > to) {
				// We can also break at this point since the array is time sorted
				break;
			}

			// if given an array of initiatorTypes to include, skip anything else
			if (typeof initiatorTypes !== "undefined" && initiatorTypes !== "*" && initiatorTypes.length) {
				if (!e.initiatorType || !BOOMR.utils.inArray(e.initiatorType, initiatorTypes)) {
					continue;
				}
			}

			accumulateServerTimingEntries(countCollector, e.serverTiming);
			filteredEntries.push(e);
		}

		var lookup = compressServerTiming(countCollector);
		return {
			entries: filteredEntries,
			serverTiming: {
				lookup: lookup,
				indexed: indexServerTiming(lookup)
			}
		};
	}

	/**
	 * Gets compressed content and transfer size information, if available
	 *
	 * @param {ResourceTiming} resource ResourceTiming object
	 *
	 * @returns {string} Compressed data (or empty string, if not available)
	 */
	function compressSize(resource) {
		var sTrans, sEnc, sDec, sizes;

		// check to see if we can add content sizes
		if (resource.encodedBodySize ||
			resource.decodedBodySize ||
			resource.transferSize) {
			//
			// transferSize: how many bytes were over the wire. It can be 0 in the case of X-O,
			// or if it was fetched from a cache.
			//
			// encodedBodySize: the size after applying encoding (e.g. gzipped size).  It is 0 if X-O or no content (eg: beacon).
			//
			// decodedBodySize: the size after removing encoding (e.g. the original content size).  It is 0 if X-O or no content (eg: beacon).
			//
			// Here are the possible combinations of values: [encodedBodySize, transferSize, decodedBodySize]
			//
			// Cross-Origin resources w/out Timing-Allow-Origin set: [0, 0, 0] -> [0, 0, 0] -> [empty]
			// 204: [0, t, 0] -> [0, t, 0] -> [e, t-e] -> [, t]
			// 304: [e, t: t <=> e, d: d>=e] -> [e, t-e, d-e]
			// 200 non-gzipped: [e, t: t>=e, d: d=e] -> [e, t-e]
			// 200 gzipped: [e, t: t>=e, d: d>=e] -> [e, t-e, d-e]
			// retrieved from cache non-gzipped: [e, 0, d: d=e] -> [e]
			// retrieved from cache gzipped: [e, 0, d: d>=e] -> [e, _, d-e]
			//
			sTrans = resource.transferSize;
			sEnc = resource.encodedBodySize;
			sDec = resource.decodedBodySize;

			// convert to an array
			sizes = [sEnc, sTrans ? sTrans - sEnc : "_", sDec ? sDec - sEnc : 0];

			// change everything to base36 and remove any trailing ,s
			return sizes.map(toBase36).join(",").replace(/,+$/, "");
		}
		else {
			return "";
		}
	}


	/**
	 * Trims the URL according to the specified URL trim patterns,
	 * then applies a length limit.
	 *
	 * @param {string} url URL to trim
	 * @param {string} urlsToTrim List of URLs (strings or regexs) to trim
	 * @returns {string} Trimmed URL
	 */
	function trimUrl(url, urlsToTrim) {
		var i, urlIdx, trim;

		if (url && urlsToTrim) {
			// trim the payload from any of the specified URLs
			for (i = 0; i < urlsToTrim.length; i++) {
				trim = urlsToTrim[i];

				if (typeof trim === "string") {
					urlIdx = url.indexOf(trim);
					if (urlIdx !== -1) {
						url = url.substr(0, urlIdx + trim.length) + "...";
						break;
					}
				}
				else if (trim instanceof RegExp) {
					if (trim.test(url)) {
						// replace the URL with the first capture group
						url = url.replace(trim, "$1") + "...";
					}
				}
			}
		}

		// apply limits
		return BOOMR.utils.cleanupURL(url, impl.urlLimit);
	}

	/**
	 * Get the latest timepoint for this resource from ResourceTiming. If the resource hasn't started downloading yet, return Infinity
	 * @param {PerformanceResourceEntry} res The resource entry to get the latest time for
	 * @returns {number} latest timepoint for the resource or now if the resource is still in progress
	 */
	function getResourceLatestTime(res) {
		// If responseEnd is non zero, return it
		if (res.responseEnd) {
			return res.responseEnd;
		}

		// If responseStart is non zero, assume it accounts for 80% of the load time, and bump it by 20%
		if (res.responseStart && res.startTime) {
			return res.responseStart + (res.responseStart - res.startTime) * 0.2;
		}

		// If the resource hasn't even started loading, assume it will come at some point in the distant future (after the beacon)
		// we'll let the server determine what to do
		return Infinity;
	}

	/**
	 * Given a 2D array representing the screen and a list of rectangular dimension tuples, turn on the screen pixels that match the dimensions.
	 * Previously set pixels that are also set with the current call will be overwritten with the new value of pixelValue
	 * @param {number[][]} currentPixels A 2D sparse array of numbers representing set pixels or undefined if no pixels are currently set.
	 * @param {number[][]} dimList A list of rectangular dimension tuples in the form [height, width, top, left] for resources to be painted on the virtual screen
	 * @param {number} pixelValue The numeric value to set all new pixels to
	 * @returns {number[][]} An updated version of currentPixels.
	 */
	function mergePixels(currentPixels, dimList, pixelValue) {
		var s = BOOMR.window.screen,
		    h = s.height, w = s.width;

		return dimList.reduce(
			function(acc, val) {
				var x_min, x_max,
				    y_min, y_max,
				    x, y;

				x_min = Math.max(0, val[3]);
				y_min = Math.max(0, val[2]);
				x_max = Math.min(val[3] + val[1], w);
				y_max = Math.min(val[2] + val[0], h);

				// Object is off-screen
				if (x_min >= x_max || y_min >= y_max) {
					return acc;
				}

				// We fill all pixels of this resource with a true
				// this is needed to correctly account for overlapping resources
				for (y = y_min; y < y_max; y++) {
					if (!acc[y]) {
						acc[y] = [];
					}

					for (x = x_min; x < x_max; x++) {
						acc[y][x] = pixelValue;
					}
				}

				return acc;
			},
			currentPixels || []
		);
	}

	/**
	 * Counts the number of pixels that are set in the given 2D array representing the screen
	 * @param {number[][]} pixels A 2D boolean array representing the screen with painted pixels set to true
	 * @param {number} [rangeMin] If included, will only count pixels >= this value
	 * @param {number} [rangeMax] If included, will only count pixels <= this value
	 * @returns {number} The number of pixels set in the passed in array
	 */
	function countPixels(pixels, rangeMin, rangeMax) {
		rangeMin = rangeMin || 0;
		rangeMax = rangeMax || Infinity;

		return pixels
			.reduce(function(acc, val) {
				return acc +
					val.filter(function(v) {
						return rangeMin <= v && v <= rangeMax;
					}).length;
			},
			0
		);
	}

	/**
	 * Returns a compressed string representation of a hash of timepoints to painted pixel count and finalized pixel count.
	 * - Timepoints are reduced to milliseconds relative to the previous timepoint while pixel count is reduced to pixels relative to the previous timepoint. Finalized pixels are reduced to be relative (negated) to full pixels for that timepoint
	 * - The relative timepoint and relative pixels are then each Base36 encoded and combined with a ~
	 * - Finally, the list of timepoints is merged, separated by ! and returned
	 * @param {object} timePoints An object in the form { "<timePoint>" : [ <object dimensions>, <object dimensions>, ...], <timePoint>: [...], ...}, where <object dimensions> is [height, width, top, left]
	 * @returns {string} The serialized compressed timepoint object with ! separating individual triads and ~ separating timepoint and pixels within the triad. The elements of the triad are the timePoint, number of pixels painted at that point, and the number of pixels finalized at that point (ie, no further paints). If the third part of the triad is 0, it is omitted, if the second part of the triad is 0, it is omitted and the repeated ~~ is replaced with a -
	 */
	function getOptimizedTimepoints(timePoints) {
		var i, roundedTimePoints = {}, timeSequence, tPixels,
		    t_prev, t, p_prev, p, f_prev, f,
		    comp, result = [];

		// Round timepoints to the nearest integral ms
		timeSequence = Object.keys(timePoints);

		for (i = 0; i < timeSequence.length; i++) {
			t = Math.round(Number(timeSequence[i]));
			if (typeof roundedTimePoints[t] === "undefined") {
				roundedTimePoints[t] = [];
			}

			// Merge
			Array.prototype.push.apply(roundedTimePoints[t], timePoints[timeSequence[i]]);
		}

		// Get all unique timepoints nearest ms sorted in ascending order
		timeSequence = Object.keys(roundedTimePoints).map(Number).sort(function(a, b) { return a - b; });

		if (timeSequence.length === 0) {
			return {};
		}

		// First loop identifies pixel first paints
		for (i = 0; i < timeSequence.length; i++) {
			t = timeSequence[i];
			tPixels = mergePixels(tPixels, roundedTimePoints[t], t);

			p = countPixels(tPixels);
			timeSequence[i] = [t, p];
		}

		// We'll make all times and pixel counts relative to the previous ones
		t_prev = 0;
		p_prev = 0;
		f_prev = 0;

		// Second loop identifies pixel final paints
		for (i = 0; i < timeSequence.length; i++) {
			t = timeSequence[i][0];
			p = timeSequence[i][1];
			f = countPixels(tPixels, 0, t);

			if (p > p_prev || f > f_prev) {
				comp = (t === Infinity ? "" : toBase36(Math.round(t - t_prev))) + "~" + toBase36(p - p_prev) + "~" + toBase36(p - f);

				comp = comp.replace(/~~/, "-").replace(/~$/, "");

				result.push(comp);

				t_prev = t;
				p_prev = p;
				f_prev = f;
			}
		}

		return result.join("!").replace(/!+$/, "");
	}

	/**
	 * Gathers performance entries and compresses the result.
	 *
	 * @param {number} from Only get timings from
	 * @param {number} to Only get timings up to
	 *
	 * @returns {object} An object containing the Optimized performance entries trie and
	 * the optimized server timing lookup
	 * @memberof BOOMR.plugins.ResourceTiming
	 */
	function getCompressedResourceTiming(from, to) {
		/*eslint no-script-url:0*/
		var i, e, results = {}, initiatorType, url, data, timePoints = {};

		var ret = getFilteredResourceTiming(from, to, impl.trackedResourceTypes);
		var entries = ret.entries, serverTiming = ret.serverTiming;

		if (!entries || !entries.length) {
			return {
				restiming: {},
				servertiming: []
			};
		}

		for (i = 0; i < entries.length; i++) {
			e = entries[i];

			//
			// Compress the RT data into a string:
			//
			// 1. Start with the initiator type, which is mapped to a number.
			// 2. Put the timestamps into an array in a set order (reverse chronological order),
			//    which pushes timestamps that are more likely to be zero (duration since
			//    startTime) towards the end of the array (eg redirect* and domainLookup*).
			// 3. Convert these timestamps to Base36, with empty or zero times being an empty string
			// 4. Join the array on commas
			// 5. Trim all trailing empty commas (eg ",,,")
			//

			// prefix initiatorType to the string
			initiatorType = INITIATOR_TYPES[e.initiatorType];
			if (typeof initiatorType === "undefined") {
				initiatorType = 0;
			}

			data = initiatorType + [
				trimTiming(e.startTime, 0),
				trimTiming(e.responseEnd, e.startTime),
				trimTiming(e.responseStart, e.startTime),
				trimTiming(e.requestStart, e.startTime),
				trimTiming(e.connectEnd, e.startTime),
				trimTiming(e.secureConnectionStart, e.startTime),
				trimTiming(e.connectStart, e.startTime),
				trimTiming(e.domainLookupEnd, e.startTime),
				trimTiming(e.domainLookupStart, e.startTime),
				trimTiming(e.redirectEnd, e.startTime),
				trimTiming(e.redirectStart, e.startTime)
			].map(toBase36).join(",").replace(/,+$/, ""); // this `replace()` removes any trailing commas

			/*
			// add content and transfer size info
			var compSize = compressSize(e);
			if (compSize !== "") {
				data += SPECIAL_DATA_PREFIX + SPECIAL_DATA_SIZE_TYPE + compSize;
			}

			if (e.hasOwnProperty("scriptAttrs")) {
				data += SPECIAL_DATA_PREFIX + SPECIAL_DATA_SCRIPT_ATTR_TYPE + e.scriptAttrs;
			}

			if (e.serverTiming && e.serverTiming.length) {
				data += SPECIAL_DATA_PREFIX + SPECIAL_DATA_SERVERTIMING_TYPE +
					e.serverTiming.reduce(function(stData, entry, entryIndex) {
						// The numeric of the entry is `value` for Chrome 61, `duration` after that
						var duration = String(typeof entry.duration !== "undefined" ? entry.duration : entry.value);
						if (duration.substring(0, 2) === "0.") {
							// lop off the leading 0
							duration = duration.substring(1);
						}
						// The name of the entry is `metric` for Chrome 61, `name` after that
						var name = entry.name || entry.metric;
						var lookupKey = identifyServerTimingEntry(serverTiming.indexed[name].index,
							serverTiming.indexed[name].descriptions[entry.description]);
						stData += (entryIndex > 0 ? "," : "") + duration + lookupKey;
						return stData;
					}, "");
			}

			if (e.hasOwnProperty("linkAttrs")) {
				data += SPECIAL_DATA_PREFIX + SPECIAL_DATA_LINK_ATTR_TYPE + e.linkAttrs;
			}
			*/

			url = trimUrl(e.name, impl.trimUrls);

			if (!e.hasOwnProperty("_data")) {
				// if this entry already exists, add a pipe as a separator
				if (results[url] !== undefined) {
					results[url] += "|" + data;
				}else {
					results[url] = data;
				}
			}
			else {
				var namespacedData = "";
				for (var key in e._data) {
					if (e._data.hasOwnProperty(key)) {
						namespacedData += SPECIAL_DATA_PREFIX + SPECIAL_DATA_NAMESPACED_TYPE + key + ":" + e._data[key];
					}
				}

				if (typeof results[url] === "undefined") {
					// we haven't seen this resource yet, treat this potential stub as the canonical version
					results[url] = data + namespacedData;
				}
				else {
					// we have seen this resource before
					// forget the timing data of `e`, just supplement the previous entry with the new `namespacedData`
					results[url] += namespacedData;
				}
			}

			if (e.visibleDimensions) {
				if (!timePoints[e.latestTime]) {
					timePoints[e.latestTime] = [];
				}
				timePoints[e.latestTime].push(e.visibleDimensions);
			}
		}

		return {
			restiming: optimizeTrie(convertToTrie(results, impl.splitAtPath), true),
			servertiming: serverTiming.lookup
		};
	}

	/**
	 * Compresses an array of ResourceTiming-like objects (those with a fetchStart
	 * and a responseStart/responseEnd) by reducing multiple objects with the same
	 * fetchStart down to a single object with the longest duration.
	 *
	 * Array must be pre-sorted by fetchStart, then by responseStart||responseEnd
	 *
	 * @param {ResourceTiming[]} resources ResourceTiming-like resources, with just
	 *  a fetchStart and responseEnd
	 *
	 * @returns Duration, in milliseconds
	 */
	function reduceFetchStarts(resources) {
		var times = [];

		if (!resources || !resources.length) {
			return times;
		}

		for (var i = 0; i < resources.length; i++) {
			var res = resources[i];

			// if there is a subsequent resource with the same fetchStart, use
			// its value instead (since pre-sort guarantee is that it's end
			// will be >= this one)
			if (i !== resources.length - 1 &&
				res.fetchStart === resources[i + 1].fetchStart) {
				continue;
			}

			// track just the minimum fetchStart and responseEnd
			times.push({
				fetchStart: res.fetchStart,
				responseEnd: res.responseStart || res.responseEnd
			});
		}

		return times;
	}

	/**
	 * Calculates the union of durations of the specified resources.  If
	 * any resources overlap, those timeslices are not double-counted.
	 *
	 * @param {ResourceTiming[]} resources Resources
	 *
	 * @returns Duration, in milliseconds
	 * @memberof BOOMR.plugins.ResourceTiming
	 */
	function calculateResourceTimingUnion(resources) {
		var i;

		if (!resources || !resources.length) {
			return 0;
		}

		// First, sort by start time, then end time
		resources.sort(function(a, b) {
			if (a.fetchStart !== b.fetchStart) {
				return a.fetchStart - b.fetchStart;
			}
			else {
				var ae = a.responseStart || a.responseEnd;
				var be = b.responseStart || b.responseEnd;

				return ae - be;
			}
		});

		// Next, find all resources with the same start time, and reduce
		// them to the largest end time.
		var times = reduceFetchStarts(resources);

		// Third, for every resource, if the start is less than the end of
		// any previous resource, change its start to the end.  If the new start
		// time is more than the end time, we can discard this one.
		var times2 = [];
		var furthestEnd = 0;

		for (i = 0; i < times.length; i++) {
			var res = times[i];

			if (res.fetchStart < furthestEnd) {
				res.fetchStart = furthestEnd;
			}

			// as long as this resource has > 0 duration, add it to our next list
			if (res.fetchStart < res.responseEnd) {
				times2.push(res);

				// keep track of the furthest end point
				furthestEnd = res.responseEnd;
			}
		}

		// Reduce down again to same start times again, and now we should
		// have no overlapping regions
		var times3 = reduceFetchStarts(times2);

		// Finally, calculate the overall time from our non-overlapping regions
		var totalTime = 0;
		for (i = 0; i < times3.length; i++) {
			totalTime += times3[i].responseEnd - times3[i].fetchStart;
		}

		return totalTime;
	}

	/**
	 * Adds 'restiming' and 'servertiming' to the beacon
	 *
	 * @param {number} from Only get timings from
	 * @param {number} to Only get timings up to
	 *
	 * @memberof BOOMR.plugins.ResourceTiming
	 */
	function addResourceTimingToBeacon(from, to) {
		var r;

		// Can't send if we don't support JSON
		if (typeof JSON === "undefined") {
			return;
		}

		BOOMR.removeVar("restiming");
		BOOMR.removeVar("servertiming");


		r = getCompressedResourceTiming(from, to);


		if (r) {
			BOOMR.info("Client supports Resource Timing API", "restiming");
			addToBeacon(r);
		}
	}

	/**
	 * Given an array of server timing entries (from the resource timing entry),
	 * [initialize and] increment our count collector of the following format: {
	 *   "metric-one": {
	 *     count: 3,
	 *     counts: {
	 *       "description-one": 2,
	 *       "description-two": 1,
	 *     }
	 *   }
	 * }
	 *
	 * @param {Object} countCollector Per-beacon collection of counts
	 * @param {Array} serverTimingEntries Server Timing Entries from a Resource Timing Entry
	 * @returns nothing
	 */
	function accumulateServerTimingEntries(countCollector, serverTimingEntries) {
		(serverTimingEntries || []).forEach(function(entry) {
			var name = entry.name || entry.metric;
			if (typeof countCollector[name] === "undefined") {
				countCollector[name] = {
					count: 0,
					counts: {}
				};
			}
			var metric = countCollector[name];
			metric.counts[entry.description] = metric.counts[entry.description] || 0;
			metric.counts[entry.description]++;
			metric.count++;
		});
	}

	/**
	 * Given our count collector of the format: {
	 *   "metric-two": {
	 *     count: 1,
	 *     counts: {
	 *       "description-three": 1,
	 *     }
	 *   },
	 *   "metric-one": {
	 *     count: 3,
	 *     counts: {
	 *       "description-one": 1,
	 *       "description-two": 2,
	 *     }
	 *   }
	 * }
	 *
	 * , return the lookup of the following format: [
	 *   ["metric-one", "description-two", "description-one"],
	 *   ["metric-two", "description-three"],
	 * ]
	 *
	 * Note: The order of these arrays of arrays matters: there are more server timing entries with
	 * name === "metric-one" than "metric-two", and more "metric-one"/"description-two" than
	 * "metric-one"/"description-one".
	 *
	 * @param {Object} countCollector Per-beacon collection of counts
	 * @returns {Array} compressed lookup array
	 */
	function compressServerTiming(countCollector) {
		return Object.keys(countCollector).sort(function(metric1, metric2) {
			return countCollector[metric2].count - countCollector[metric1].count;
		}).reduce(function(array, name) {
			var sorted = Object.keys(countCollector[name].counts).sort(function(description1, description2) {
				return countCollector[name].counts[description2] -
					countCollector[name].counts[description1];
			});

			array.push(sorted.length === 1 && sorted[0] === "" ?
				name : // special case: no non-empty descriptions
				[name].concat(sorted));
			return array;
		}, []);
	}

	/**
	 * Given our lookup of the format: [
	 *   ["metric-one", "description-one", "description-two"],
	 *   ["metric-two", "description-three"],
	 * ]
	 *
	 * , create a O(1) name/description to index values lookup dictionary of the format: {
	 *   metric-one: {
	 *     index: 0,
	 *     descriptions: {
	 *       "description-one": 0,
	 *       "description-two": 1,
	 *     }
	 *   }
	 *   metric-two: {
	 *     index: 1,
	 *     descriptions: {
	 *       "description-three": 0,
	 *     }
	 *   }
	 * }
	 *
	 * @param {Array} lookup compressed lookup array
	 * @returns {Object} indexed version of the compressed lookup array
	 */
	function indexServerTiming(lookup) {
		return lookup.reduce(function(serverTimingIndex, compressedEntry, entryIndex) {
			var name, descriptions;
			if (Array.isArray(compressedEntry)) {
				name = compressedEntry[0];
				descriptions = compressedEntry.slice(1).reduce(function(descriptionCollector, description, descriptionIndex) {
					descriptionCollector[description] = descriptionIndex;
					return descriptionCollector;
				}, {});
			}
			else {
				name = compressedEntry;
				descriptions = {
					"": 0
				};
			}

			serverTimingIndex[name] = {
				index: entryIndex,
				descriptions: descriptions
			};
			return serverTimingIndex;
		}, {});
	}

	/**
	 * Given entryIndex and descriptionIndex, create the shorthand key into the lookup
	 * response format is ":<entryIndex>.<descriptionIndex>"
	 * either/both entryIndex or/and descriptionIndex can be omitted if equal to 0
	 * the "." can be ommited if descriptionIndex is 0
	 * the ":" can be ommited if entryIndex and descriptionIndex are 0
	 *
	 * @param {Integer} entryIndex index of the entry
	 * @param {Integer} descriptionIndex index of the description
	 * @returns {String} key into the compressed lookup
	 */
	function identifyServerTimingEntry(entryIndex, descriptionIndex) {
		var s = "";
		if (entryIndex) {
			s += entryIndex;
		}
		if (descriptionIndex) {
			s += "." + descriptionIndex;
		}
		if (s.length) {
			s = ":" + s;
		}
		return s;
	}

	/**
	 * Adds optimized performance entries trie and (conditionally) the optimized server timing lookup to the beacon
	 *
	 * @param {Object} r An object containing the optimized performance entries trie and the optimized server timing
	 *  lookup
	 */
	function addToBeacon(r) {
		BOOMR.addVar("restiming", JSON.stringify(r.restiming));
		if (r.servertiming.length) {
			BOOMR.addVar("servertiming", BOOMR.utils.serializeForUrl(r.servertiming));
		}
	}

	/**
	 * Given our lookup of the format: [
	 *   ["metric-one", "description-one", "description-two"],
	 *   ["metric-two", "description-three"],
	 * ]
	 *
	 * , and a key of the format: duration:entryIndex.descriptionIndex,
	 * return the decompressed server timing entry (name, duration, description)
	 *
	 * Note: code only included as POC
	 *
	 * @param {Array} lookup compressed lookup array
	 * @param {Integer} key key into the compressed lookup
	 * @returns {Object} decompressed resource timing entry (name, duration, description)
	 */

	impl = {
		complete: false,
		sentNavBeacon: false,
		initialized: false,
		supported: null,
		xhr_load: function() {
			if (this.complete) {
				return;
			}

			// page load might not have happened, or will happen later, so
			// set us as complete so we don't hold the page load
			this.complete = true;
			BOOMR.sendBeacon();
		},
		xssBreakWords: DEFAULT_XSS_BREAK_WORDS,
		urlLimit: DEFAULT_URL_LIMIT,

		// overridable
		clearOnBeacon: false,
		trimUrls: [],
		serverTiming: true,
		monitorClearResourceTimings: false,
		splitAtPath: false,
		// overridable

		/**
		 * Array of resource types to track, or "*" for all.
		 *  @type {string[]|string}
		 */
		trackedResourceTypes: "*",
		done: function() {
			// Stop if we've already sent a nav beacon (both xhr and spa* beacons
			// add restiming manually).
			if (this.sentNavBeacon) {
				return;
			}

			addResourceTimingToBeacon();

			this.complete = true;
			this.sentNavBeacon = true;

			BOOMR.sendBeacon();
		},

		onBeacon: function(vars) {
			var p = BOOMR.getPerformance();

			// clear metrics
			if (vars.hasOwnProperty("restiming")) {
				BOOMR.removeVar("restiming");
			}
			if (vars.hasOwnProperty("servertiming")) {
				BOOMR.removeVar("servertiming");
			}

			if (impl.clearOnBeacon && p) {
				var clearResourceTimings = p.clearResourceTimings || p.webkitClearResourceTimings;
				if (clearResourceTimings && typeof clearResourceTimings === "function") {
					clearResourceTimings.call(p);
				}
			}
		},

		prerenderToVisible: function() {
			// ensure we add our data to the beacon even if we had added it
			// during prerender (in case another beacon went out in between)
			this.sentNavBeacon = false;

			// add our data to the beacon
			this.done();
		}
	};

	BOOMR.plugins.ResourceTiming = {
		/**
		 * Initializes the plugin.
		 *
		 * @param {object} config Configuration
		 * @param {string[]} [config.ResourceTiming.xssBreakWorks] Words that will be broken (by
		 * ensuring the optimized trie doesn't contain the whole string) in URLs,
		 * to ensure NoScript doesn't think this is an XSS attack.
		 *
		 * Defaults to `DEFAULT_XSS_BREAK_WORDS`.
		 * @param {boolean} [config.ResourceTiming.clearOnBeacon] Whether or not to clear ResourceTiming
		 * data on each beacon.
		 * @param {number} [config.ResourceTiming.urlLimit] URL length limit, after which `...` will be used
		 * @param {string[]|RegExp[]} [config.ResourceTiming.trimUrls] List of strings of RegExps
		 * to trim from URLs.
		 * @param {boolean} [config.ResourceTiming.monitorClearResourceTimings] Whether or not to instrument
		 * `performance.clearResourceTimings`.
		 * @param {boolean} [config.ResourceTiming.splitAtPath] Whether or not to split the ResourceTiming
		 * compressed Trie at the path separator (faster processing, but larger result).
		 *
		 * @returns {@link BOOMR.plugins.ResourceTiming} The ResourceTiming plugin for chaining
		 * @memberof BOOMR.plugins.ResourceTiming
		 */
		init: function(config) {
			BOOMR.utils.pluginConfig(impl, config, "ResourceTiming",
				["xssBreakWords", "clearOnBeacon", "urlLimit", "trimUrls", "trackedResourceTypes", "serverTiming",
					"monitorClearResourceTimings", "splitAtPath"]);

			if (impl.initialized) {
				return this;
			}

			if (this.is_supported()) {
				BOOMR.subscribe("page_ready", impl.done, null, impl);
				BOOMR.subscribe("prerender_to_visible", impl.prerenderToVisible, null, impl);
				BOOMR.subscribe("xhr_load", impl.xhr_load, null, impl);
				BOOMR.subscribe("beacon", impl.onBeacon, null, impl);
				BOOMR.subscribe("before_unload", impl.done, null, impl);

				if (impl.monitorClearResourceTimings) {
					var self = this;
					BOOMR.window.performance.clearResourceTimings = (function(_){
						return function() {
							self.addResources(BOOMR.window.performance.getEntriesByType("resource"));
							_.apply(BOOMR.window.performance, arguments);
						};
					})(BOOMR.window.performance.clearResourceTimings);
				}
			}
			else {
				impl.complete = true;
			}

			impl.initialized = true;

			return this;
		},

		/**
		 * Whether or not this plugin is complete
		 *
		 * @returns {boolean} `true` if the plugin is complete
		 * @memberof BOOMR.plugins.ResourceTiming
		 */
		is_complete: function() {
			return true;
		},

		/**
		 * Whether or not this ResourceTiming is enabled and supported.
		 *
		 * @returns {boolean} `true` if ResourceTiming plugin is enabled.
		 * @memberof BOOMR.plugins.ResourceTiming
		 */
		is_enabled: function() {
			return impl.initialized && this.is_supported();
		},

		/**
		 * Whether or not ResourceTiming is supported in this browser.
		 *
		 * @returns {boolean} `true` if ResourceTiming is supported.
		 * @memberof BOOMR.plugins.ResourceTiming
		 */
		is_supported: function() {
			var p;

			if (impl.supported !== null) {
				return impl.supported;
			}

			// check for getEntriesByType and the entry type existing
			var p = BOOMR.getPerformance();
			impl.supported = p &&
			    typeof p.getEntriesByType === "function" &&
			    typeof window.PerformanceResourceTiming !== "undefined";

			return impl.supported;
		},

		/**
		 * Saves an array of `PerformanceResourceTiming`-shaped objects which we will later insert into the trie.
		 *
		 * @param {array<object>} resources Array of objects that are shaped like `PerformanceResourceTiming`s
		 * @param {high-resolution-timestamp} epoch Optional epoch for all of the timestamps of all of the resources
		 *
		 * @memberof BOOMR.plugins.ResourceTiming
		 */
		addResources: function(resources, epoch) {
			if (!this.is_supported() || !BOOMR.utils.isArray(resources)) {
				return;
			}

			impl.collectedEntries = impl.collectedEntries || [];
			if (typeof epoch === "number") {
				var topEpoch = BOOMR.window.performance.timeOrigin || BOOMR.window.performance.timing.navigationStart;
				var offset = epoch - topEpoch;
				resources = BOOMR.utils.arrayFilter(resources, function(entry) {
					for (var field = 0; field < RT_FIELDS_TIMESTAMPS.length; field++) {
						var key = RT_FIELDS_TIMESTAMPS[field];
						if (entry.hasOwnProperty(key)) {
							entry[key] += offset;
						}
					}
					return true;
				});
			}
			Array.prototype.push.apply(impl.collectedEntries, resources);
		},

		//
		// Public Exports
		//
		getCompressedResourceTiming: getCompressedResourceTiming,
		getFilteredResourceTiming: getFilteredResourceTiming,
		calculateResourceTimingUnion: calculateResourceTimingUnion,
		addResourceTimingToBeacon: addResourceTimingToBeacon,
		addToBeacon: addToBeacon

		//
		// Test Exports (only for debug)
		//
	};

}());



/**
 * The cache reload plugin forces the browser to update its cached copy of boomerang.
 *
 * The file at `url` should look like the sample below.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Beacon Parameters
 *
 * This plugin adds no parameters to the beacon.
 *
 * @example
 * <!doctype html>
 * <html>
 * <head>
 *   <script src="boomerang.js"></script>
 * </head>
 * <body>
 *   <script>
 *   // required version needs to be passed in as a query string parameter
 *   // like v=0.9.123456789
 *   var boom_ver = BOOMR.version.split('.'),
 *   var reqd_ver = location.search.replace(/.*v=([0-9\.]+)/, '$1').split('.');
 *   if ((boom_ver[0] < reqd_ver[0])
 *     || (boom_ver[0] == reqd_ver[0] && boom_ver[1] < reqd_ver[1])
 *     || (boom_ver[0] == reqd_ver[0] && boom_ver[1] == reqd_ver[1] && boom_ver[2] < reqd_ver[2])
 *   ) {
 *     location.reload(true);
 *   }
 *   </script>
 * </body>
 * </html>
 * @see {@link http://www.lognormal.com/blog/2012/06/05/updating-cached-boomerang/}
 * @see {@link http://www.lognormal.com/blog/2012/06/17/more-on-updating-boomerang/}
 *
 * @class BOOMR.plugins.CACHE_RELOAD
 */
(function() {



	if (BOOMR.plugins.CACHE_RELOAD) {
		return;
	}

	var impl = {
		url: ""
	};

	BOOMR.plugins.CACHE_RELOAD = {
		/**
		 * Initializes the plugin.
		 *
		 * @param {object} config Configuration
		 * @param {string} [config.CACHE_RELOAD.url] By default, this is set to the empty string,
		 * which has the effect of disabling the Cache Reload plugin.
		 *
		 * Set the `url` parameter to the URL that will do handle forcing the reload.
		 *
		 * See the example for what this URL's output should look like.
		 * @returns {@link BOOMR.plugins.CACHE_RELOAD} The CACHE_RELOAD plugin for chaining
		 * @memberof BOOMR.plugins.CACHE_RELOAD
		 */
		init: function(config) {
			BOOMR.utils.pluginConfig(impl, config, "CACHE_RELOAD", ["url"]);

			if (!impl.url) {
				return this;
			}

			// we use document and not BOOMR.window.document since
			// we can run inside the boomerang iframe if any
			var i = document.createElement("iframe");
			i.style.display = "none";
			i.src = impl.url;
			document.body.appendChild(i);

			return this;
		},

		/**
		 * This plugin is always complete (ready to send a beacon)
		 *
		 * @returns {boolean} `true`
		 * @memberof BOOMR.plugins.CACHE_RELOAD
		 */
		is_complete: function() {
			// we always return true since this plugin never adds anything to the beacon
			return true;
		}
	};

}());

/**
 * Adds support for [MD5](https://en.wikipedia.org/wiki/MD5) to Boomerang
 * (as `BOOMR.utils.md5`).
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## License
 *
 * JavaScript MD5 1.0.1
 * https://github.com/blueimp/JavaScript-MD5
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 *
 * Based on
 * A JavaScript implementation of the RSA Data Security, Inc. MD5 Message
 * Digest Algorithm, as defined in RFC 1321.
 * Version 2.2 Copyright (C) Paul Johnston 1999 - 2009
 * Other contributors: Greg Holt, Andrew Kepert, Ydnar, Lostinet
 * Distributed under the BSD License
 * See http://pajhome.org.uk/crypt/md5 for more info.
 *
 * ## Beacon Parameters
 *
 * This plugin adds no parameters to the beacon.
 *
 * @class BOOMR.utils.MD5
 */

(function() {
	/*jslint bitwise: true */
	/*global unescape*/

	"use strict";


	BOOMR.utils = BOOMR.utils || {};

	if (BOOMR.utils && BOOMR.utils.md5) {
		return;
	}

	/*
	* Add integers, wrapping at 2^32. This uses 16-bit operations internally
	* to work around bugs in some JS interpreters.
	*/
	function safe_add(x, y) {
		var lsw = (x & 0xFFFF) + (y & 0xFFFF),
		    msw = (x >> 16) + (y >> 16) + (lsw >> 16);
		return (msw << 16) | (lsw & 0xFFFF);
	}

	/*
	* Bitwise rotate a 32-bit number to the left.
	*/
	function bit_rol(num, cnt) {
		return (num << cnt) | (num >>> (32 - cnt));
	}

	/*
	* These functions implement the four basic operations the algorithm uses.
	*/
	function md5_cmn(q, a, b, x, s, t) {
		return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s), b);
	}
	function md5_ff(a, b, c, d, x, s, t) {
		return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
	}
	function md5_gg(a, b, c, d, x, s, t) {
		return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
	}
	function md5_hh(a, b, c, d, x, s, t) {
		return md5_cmn(b ^ c ^ d, a, b, x, s, t);
	}
	function md5_ii(a, b, c, d, x, s, t) {
		return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
	}

	/*
	* Calculate the MD5 of an array of little-endian words, and a bit length.
	*/
	function binl_md5(x, len) {
		/* append padding */
		x[len >> 5] |= 0x80 << (len % 32);
		x[(((len + 64) >>> 9) << 4) + 14] = len;

		var i, olda, oldb, oldc, oldd,
		    a =  1732584193,
		    b = -271733879,
		    c = -1732584194,
		    d =  271733878;

		for (i = 0; i < x.length; i += 16) {
			olda = a;
			oldb = b;
			oldc = c;
			oldd = d;

			a = md5_ff(a, b, c, d, x[i],       7, -680876936);
			d = md5_ff(d, a, b, c, x[i +  1], 12, -389564586);
			c = md5_ff(c, d, a, b, x[i +  2], 17,  606105819);
			b = md5_ff(b, c, d, a, x[i +  3], 22, -1044525330);
			a = md5_ff(a, b, c, d, x[i +  4],  7, -176418897);
			d = md5_ff(d, a, b, c, x[i +  5], 12,  1200080426);
			c = md5_ff(c, d, a, b, x[i +  6], 17, -1473231341);
			b = md5_ff(b, c, d, a, x[i +  7], 22, -45705983);
			a = md5_ff(a, b, c, d, x[i +  8],  7,  1770035416);
			d = md5_ff(d, a, b, c, x[i +  9], 12, -1958414417);
			c = md5_ff(c, d, a, b, x[i + 10], 17, -42063);
			b = md5_ff(b, c, d, a, x[i + 11], 22, -1990404162);
			a = md5_ff(a, b, c, d, x[i + 12],  7,  1804603682);
			d = md5_ff(d, a, b, c, x[i + 13], 12, -40341101);
			c = md5_ff(c, d, a, b, x[i + 14], 17, -1502002290);
			b = md5_ff(b, c, d, a, x[i + 15], 22,  1236535329);

			a = md5_gg(a, b, c, d, x[i +  1],  5, -165796510);
			d = md5_gg(d, a, b, c, x[i +  6],  9, -1069501632);
			c = md5_gg(c, d, a, b, x[i + 11], 14,  643717713);
			b = md5_gg(b, c, d, a, x[i],      20, -373897302);
			a = md5_gg(a, b, c, d, x[i +  5],  5, -701558691);
			d = md5_gg(d, a, b, c, x[i + 10],  9,  38016083);
			c = md5_gg(c, d, a, b, x[i + 15], 14, -660478335);
			b = md5_gg(b, c, d, a, x[i +  4], 20, -405537848);
			a = md5_gg(a, b, c, d, x[i +  9],  5,  568446438);
			d = md5_gg(d, a, b, c, x[i + 14],  9, -1019803690);
			c = md5_gg(c, d, a, b, x[i +  3], 14, -187363961);
			b = md5_gg(b, c, d, a, x[i +  8], 20,  1163531501);
			a = md5_gg(a, b, c, d, x[i + 13],  5, -1444681467);
			d = md5_gg(d, a, b, c, x[i +  2],  9, -51403784);
			c = md5_gg(c, d, a, b, x[i +  7], 14,  1735328473);
			b = md5_gg(b, c, d, a, x[i + 12], 20, -1926607734);

			a = md5_hh(a, b, c, d, x[i +  5],  4, -378558);
			d = md5_hh(d, a, b, c, x[i +  8], 11, -2022574463);
			c = md5_hh(c, d, a, b, x[i + 11], 16,  1839030562);
			b = md5_hh(b, c, d, a, x[i + 14], 23, -35309556);
			a = md5_hh(a, b, c, d, x[i +  1],  4, -1530992060);
			d = md5_hh(d, a, b, c, x[i +  4], 11,  1272893353);
			c = md5_hh(c, d, a, b, x[i +  7], 16, -155497632);
			b = md5_hh(b, c, d, a, x[i + 10], 23, -1094730640);
			a = md5_hh(a, b, c, d, x[i + 13],  4,  681279174);
			d = md5_hh(d, a, b, c, x[i],      11, -358537222);
			c = md5_hh(c, d, a, b, x[i +  3], 16, -722521979);
			b = md5_hh(b, c, d, a, x[i +  6], 23,  76029189);
			a = md5_hh(a, b, c, d, x[i +  9],  4, -640364487);
			d = md5_hh(d, a, b, c, x[i + 12], 11, -421815835);
			c = md5_hh(c, d, a, b, x[i + 15], 16,  530742520);
			b = md5_hh(b, c, d, a, x[i +  2], 23, -995338651);

			a = md5_ii(a, b, c, d, x[i],       6, -198630844);
			d = md5_ii(d, a, b, c, x[i +  7], 10,  1126891415);
			c = md5_ii(c, d, a, b, x[i + 14], 15, -1416354905);
			b = md5_ii(b, c, d, a, x[i +  5], 21, -57434055);
			a = md5_ii(a, b, c, d, x[i + 12],  6,  1700485571);
			d = md5_ii(d, a, b, c, x[i +  3], 10, -1894986606);
			c = md5_ii(c, d, a, b, x[i + 10], 15, -1051523);
			b = md5_ii(b, c, d, a, x[i +  1], 21, -2054922799);
			a = md5_ii(a, b, c, d, x[i +  8],  6,  1873313359);
			d = md5_ii(d, a, b, c, x[i + 15], 10, -30611744);
			c = md5_ii(c, d, a, b, x[i +  6], 15, -1560198380);
			b = md5_ii(b, c, d, a, x[i + 13], 21,  1309151649);
			a = md5_ii(a, b, c, d, x[i +  4],  6, -145523070);
			d = md5_ii(d, a, b, c, x[i + 11], 10, -1120210379);
			c = md5_ii(c, d, a, b, x[i +  2], 15,  718787259);
			b = md5_ii(b, c, d, a, x[i +  9], 21, -343485551);

			a = safe_add(a, olda);
			b = safe_add(b, oldb);
			c = safe_add(c, oldc);
			d = safe_add(d, oldd);
		}
		return [a, b, c, d];
	}

	/*
	* Convert an array of little-endian words to a string
	*/
	function binl2rstr(input) {
		var i,
		    output = "";
		for (i = 0; i < input.length * 32; i += 8) {
			output += String.fromCharCode((input[i >> 5] >>> (i % 32)) & 0xFF);
		}
		return output;
	}

	/*
	* Convert a raw string to an array of little-endian words
	* Characters >255 have their high-byte silently ignored.
	*/
	function rstr2binl(input) {
		var i,
		    output = [];
		output[(input.length >> 2) - 1] = undefined;
		for (i = 0; i < output.length; i += 1) {
			output[i] = 0;
		}
		for (i = 0; i < input.length * 8; i += 8) {
			output[i >> 5] |= (input.charCodeAt(i / 8) & 0xFF) << (i % 32);
		}
		return output;
	}

	/*
	* Calculate the MD5 of a raw string
	*/
	function rstr_md5(s) {
		return binl2rstr(binl_md5(rstr2binl(s), s.length * 8));
	}

	/*
	* Calculate the HMAC-MD5, of a key and some data (raw strings)
	*/
	function rstr_hmac_md5(key, data) {
		var i,
		    bkey = rstr2binl(key),
		    ipad = [],
		    opad = [],
		    hash;
		ipad[15] = opad[15] = undefined;
		if (bkey.length > 16) {
			bkey = binl_md5(bkey, key.length * 8);
		}
		for (i = 0; i < 16; i += 1) {
			ipad[i] = bkey[i] ^ 0x36363636;
			opad[i] = bkey[i] ^ 0x5C5C5C5C;
		}
		hash = binl_md5(ipad.concat(rstr2binl(data)), 512 + data.length * 8);
		return binl2rstr(binl_md5(opad.concat(hash), 512 + 128));
	}

	/*
	* Convert a raw string to a hex string
	*/
	function rstr2hex(input) {
		var hex_tab = "0123456789abcdef",
		    output = "",
		    x,
		    i;
		for (i = 0; i < input.length; i += 1) {
			x = input.charCodeAt(i);
			output += hex_tab.charAt((x >>> 4) & 0x0F) +
				hex_tab.charAt(x & 0x0F);
		}
		return output;
	}

	/*
	* Encode a string as utf-8
	*/
	function str2rstr_utf8(input) {
		return unescape(encodeURIComponent(input));
	}

	/*
	* Take string arguments and return either raw or hex encoded strings
	*/
	function raw_md5(s) {
		return rstr_md5(str2rstr_utf8(s));
	}
	function hex_md5(s) {
		return rstr2hex(raw_md5(s));
	}
	function raw_hmac_md5(k, d) {
		return rstr_hmac_md5(str2rstr_utf8(k), str2rstr_utf8(d));
	}
	function hex_hmac_md5(k, d) {
		return rstr2hex(raw_hmac_md5(k, d));
	}

	/**
	 * Calculates the MD5 of the specified string and optional key.
	 *
	 * @param {string} string Input string
	 * @param {string} [key] Key
	 * @param {boolean} [raw] Whether or not to return data raw MD5 (versus hex-encoded)
	 *
	 * @returns {string} Raw or hex-encoded MD5 of the input string and key
	 *
	 * @memberof BOOMR.utils.MD5
	 */
	function md5(string, key, raw) {
		if (!key) {
			if (!raw) {
				return hex_md5(string);
			}
			return raw_md5(string);
		}
		if (!raw) {
			return hex_hmac_md5(key, string);
		}
		return raw_hmac_md5(key, string);
	}

	BOOMR.utils.MD5 = md5;
}());

/**
 * The `Compression` plugin adds common compression code that other plugins can use.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Beacon Parameters
 *
 * This plugin adds no parameters to the beacon.
 *
 * @class BOOMR.utils.Compression
 */
(function() {

	BOOMR.utils = BOOMR.utils || {};

	if (BOOMR.utils && BOOMR.utils.Compression) {
		return;
	}

	var self = BOOMR.utils.Compression = {};

	/**
	 * Converts an object to URL-friendly JSON
	 *
	 * Adapted from https://github.com/Sage/jsurl
	 *
	 * Changes:
	 *  Formatting
	 *  Removal of Array.map and Object.map for compat with IE 6-8
	 *  Change of str[i] syntax to str.charAt(i) for compat with IE 6-7
	 *
	 * @param {object} v Object to convert
	 *
	 * @returns {string} URL-friendly JSON
	 * @memberof BOOMR.utils.Compression
	 */
	self.jsUrl = function jsUrl(v) {
		/**
		 * Encodes the specified string
		 *
		 * @param {string} s String
		 *
		 * @returns {string} Encoded string
		 */
		function encode(s) {
			if (!/[^\w-.]/.test(s)) {
				// if the string is only made up of alpha-numeric, underscore,
				// dash or period, we can use it directly.
				return s;
			}

			// we need to escape other characters
			s = s.replace(/[^\w-.]/g, function(ch) {
				if (ch === "$") {
					return "!";
				}

				// use the character code for this one
				ch = ch.charCodeAt(0);

				if (ch < 0x100) {
					// if less than 256, use "*[2-char code]"
					return "*" + ("00" + ch.toString(16)).slice(-2);
				}
				else {
					// use "**[4-char code]"
					return "**" + ("0000" + ch.toString(16)).slice(-4);
				}
			});

			return s;
		}

		var tmpAry = [];

		switch (typeof v) {
		case "number":
			// for finite numbers, return "~[number]"
			return isFinite(v) ? "~" + v : "~null";

		case "string":
			// "~'[encoded string]"
			return "~'" + encode(v);

		case "boolean":
			// "~true" or "~false"
			return "~" + v;

		case "object":
      return v; // not compress

			if (!v) {
				return "~null";
			}

			if (BOOMR.utils.isArray(v)) {
				// iterate instead of Array.map for compat
				for (var i = 0; i < v.length; i++) {
					if (i in v) {
						tmpAry[i] = self.jsUrl(v[i]) || "~null";
					}
				}

				return "~(" + (tmpAry.join("") || "~") + ")";
			}
			else {
				// iterate instead of Object.map for compat
				for (var key in v) {
					if (v.hasOwnProperty(key)) {
						var val = self.jsUrl(v[key]);
						// skip undefined and functions

						if (val) {
							tmpAry.push(encode(key) + val);
						}
					}
				}

				return "~(" + tmpAry.sort().join("~") + ")";
			}

		default:
			// function, undefined
			return undefined;
		}
	};

}());

/**
 * The `Errors` plugin automatically captures JavaScript and other errors from
 * your web application.
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Sources of Errors
 *
 * When the `Errors` plugin is enabled, the following sources of errors are captured:
 *
 * * JavaScript runtime errors captured via the
 *   [`onerror`](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onerror)
 *   global event handler
 * * [``XMLHttpRequest``](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest)
 *   responses that were not successful.  Note {@link BOOMR.plugins.AutOXHR} is required
 *   if using this.
 * * Any calls to [``window.console.error``](https://developer.mozilla.org/en-US/docs/Web/API/Console/error)
 * * JavaScript runtime errors that happen during a callback for
 *   [``addEventListener``](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
 * * JavaScript runtime errors that happen during a callback for
 *   [``setTimeout``](https://developer.mozilla.org/en-US/docs/Web/API/WindowTimers/setTimeout)
 *   and [``setInterval``](https://developer.mozilla.org/en-US/docs/Web/API/WindowTimers/setInterval)
 * * Manually sent errors via {@link BOOMR.plugins.Errors.send}
 * * Functions that threw an exception that were wrapped via {@link BOOMR.plugins.Errors.wrap}
 * * Functions that threw an exception that were run via {@link BOOMR.plugins.Errors.test}
 * * JavaScript runtime errors captured via the
 *   [`unhandledrejection`](https://developer.mozilla.org/en-US/docs/Web/Events/unhandledrejection)
 *   global event handler. Disabled by default.
 * * JavaScript runtime warnings captured via the
 *   [`Reporting API`](https://www.w3.org/TR/reporting/#reporting-observer). Disabled by default.
 *
 * These are all enabled by default, and can be
 * {@link BOOMR.plugins.Errors.init manually turned off}.
 *
 * ## Supported Browsers
 *
 * The `Errors` plugin can be enabled for all browsers, though some older browsers
 * may not be able to capture the full breadth of sources of errors. Due to the lack
 * of error detail on some older browsers, some errors may be reported more than once.
 *
 * Notable browsers:
 *
 * * Internet Explorer <= 8: Does not support capturing `XMLHttpRequest` errors.
 *
 * ## Manually Sending Errors
 *
 * Besides automatically capturing errors from `onerror`, `XMLHttpRequest`,
 * `console.error` or event handlers such as `setTimeout`, you can also manually
 * send errors.
 *
 * There are three ways of doing this as follows:
 *
 * * {@link BOOMR.plugins.Errors.send}: Immediately sends an error.
 * * {@link BOOMR.plugins.Errors.wrap}: Wraps a function with error tracking
 * * {@link BOOMR.plugins.Errors.test}: Runs the function and captures any errors.
 *
 * ## Error callback
 *
 * You can specify an {@link BOOMR.plugins.Errors.init `onError`} function that
 * the Errors plugin will call any time an error is captured on the page.
 *
 * If your `onError` function returns `true`, the error will be captured.
 *
 * If your `onError` function does not return `true`, the error will be ignored.
 *
 * Example:
 *
 * ```
 * BOOMR.init({
 *   Errors: {
 *     onError: function(err) {
 *       if (err.message && err.message.indexOf("internally handled")) {
 *         return false;
 *       }
 *       return true;
 *     }
 *   }
 * });
 * ```
 *
 * ## When to Send Errors
 *
 * By default, errors captured during the page load will be sent along with the
 * page load beacon.
 *
 * Errors that happen after the page load will not be captured or sent.
 *
 * To enable capturing of errors after page load, you need to set
 * {@link BOOMR.plugins.Errors.init `sendAfterOnload`} to `true`. If set,
 * errors that happen after the page load will be sent at most once every
 * {@link BOOMR.plugins.Errors.init `sendInterval`} (which defaults to 1 second)
 * on a new beacon.
 *
 * Example:
 *
 * ```
 * BOOMR.init({
 *   Errors: {
 *     sendAfterOnload: true,
 *     sendInterval: 5000
 *   }
 * });
 * ```
 *
 * ## How Many Errors to Capture
 *
 * The `Errors` plugin will only capture up to
 * {@link BOOMR.plugins.Errors.init `maxErrors`} (defaults to 10) distinct
 * errors on the page.
 *
 * Please note that duplicate errors (those with the same function name, stack,
 * and so on) are tracked as single distinct error, with a `count` of how many
 * times it was seen.
 *
 * You can increase (or decrease) `maxErrors`. For example:
 * ```
 * BOOMR.init({
 *   Errors: {
 *     maxErrors: 20
 *   }
 * });
 * ```
 *
 * ## Dealing with Script Error
 *
 * When looking at JavaScript errors, you will likely come across the generic error
 * message: `Script error.`
 *
 * `Script Error.` is the message that browsers send to the
 * [`window.onerror`](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onerror)
 * global exception handler when the error was triggered by a script loaded from a different (cross)
 * [origin](https://developer.mozilla.org/en-US/docs/Glossary/Origin).  `window.onerror`
 * is used by Boomerang so that it gets notified of all unhandled exceptions.
 *
 * The `Script Error.` string is given _instead_ of the real error message
 * and does not contain any useful information about what caused the error. In addition,
 * there is no stack associated with the message, so it's impossible to know where
 * or why the error occurred.
 *
 * Browsers mask the real error message for cross-origin scripts due to security and
 * privacy concerns - they don't want to leak sensitive information in the message
 * or stack.  The only thing that `window.onerror` knows for cross-origin scripts
 * is that an error occurred, not where or why.
 *
 * ### Example
 *
 * For an example of where you'd see `Script Error.`, consider the following code
 * that lives on `website.com`:
 *
 * ```html
 * <html>
 *     <head>
 *         <title>website.com</title>
 *     </head>
 *     <body>
 *         <script>
 *             window.onerror = function(message, url, line, column, error) {
 *                 console.log("window.onerror: " + message);
 *                 console.log((error && error.stack) ? error.stack : "(no stack)");
 *             };
 *         </script>
 *         <script src="my-script.js"></script>
 *         <script src="https://anothersite.com/my-script.js"></script>
 *     </body>
 * </html>
 * ```
 *
 * Assume `my-script.js` is the same file being served from both `website.com` and
 * `anothersite.com`:
 *
 * ```js
 * function runCode() {
 *     a = b + 1;
 * }
 *
 * runCode();
 * ```
 *
 * When `my-script.js` is loaded from `website.com`, it will be executed twice:
 *
 * 1. First on the same-origin, where we'll see the full error message followed by
 *     the stack:
 *
 *     ```
 *     window.onerror: Uncaught ReferenceError: b is not defined
 *
 *     ReferenceError: b is not defined
 *         at runCode (my-script.js:2)
 *         at my-script.js:5
 *     ```
 *
 * 2. Then, it will be loaded from `https://anothersite.com/my-script.js`, which
 *     will be considered cross-origin and only `Script Error.` will be logged:
 *
 *     ```
 *     window.onerror: Script error.
 *
 *     (no stack)
 *     ```
 *
 * As you can see, browser shares the full details of the exception when it's served
 * from the same origin as the website, but if it's served from any other origin,
 * it will be considered cross-origin and no details will be shared.
 *
 * Note that while the browser only shares `Script Error.` to `window.onerror`
 * for cross-origin scripts, if _you_ have browser developer tools open,
 * the browser will show _you_ the full error message in the Console.  This is
 * because there aren't any security or privacy concerns for a developer looking at
 * their own machine's information.
 *
 * ### When You'll See Script Error
 *
 * Unfortunately `Script Error.` will be shown in many legitimate use-cases,
 * such as:
 *
 * 1. When serving your website's JavaScript from a CDN (since it will be coming
 *     from a different origin)
 *
 * 2. When loading a library such as jQuery or Angular from their CDN, i.e.
 *     [Google's Hosted Libraries](https://developers.google.com/speed/libraries/)
 *     or [cdnjs](https://cdnjs.com/)
 *
 * 3. When a third-party script loads from another domain
 *
 * The good news is that in many of these cases, there are changes you can make to
 * ensure the full error message and stack are shared with `window.onerror`.
 *
 * ### Fixing Script Error
 *
 * To ensure a cross-origin script shares full error details with `window.onerror`,
 * you'll need to do **two** things:
 *
 * 1. Add `crossorigin="anonymous"` to the `<script>` tag
 *
 *     The [`crossorigin="anonymous"` attribute](https://www.w3.org/TR/html5/infrastructure.html#cors-settings-attribute)
 *     tells the browser that the script should be fetched without sending
 *     any cookies or HTTP authentication
 *
 * 2. Add the `Access-Control-Allow-Origin` (ACAO) header to the JavaScript file's response.
 *
 *     The `Access-Control-Allow-Origin` header is part of the
 *     [Cross Origin Resource Sharing](https://www.w3.org/TR/cors/) (CORS) standard.
 *
 *     The ACAO header **must** be set in the JavaScript's HTTP response headers.
 *
 *     An example header that sets ACAO for all calling origins would be:
 *
 *     `Access-Control-Allow-Origin: *`
 *
 * If both conditions are true, cross-origin JavaScript files will report errors
 * to `window.onerror` with the correct error message and full stack.
 *
 * The biggest challenge to getting this working is that (1) is within the _site's_
 * control while (2) can only be configured by the _owner_ of the JavaScript.  If you're
 * loading JavaScript from a third-party, you will need to encourage them to add the
 * ACAO header if it's not already set.  The good news is that many CDNs and
 * third-parties set the ACAO header already.
 *
 * ### Workarounds for Third Parties that aren't sending ACAO
 *
 * One way to help monitor for errors coming from third-party scripts that aren't
 * setting ACAO (and aren't within your control) is by manually wrapping calls
 * to any of the third-party script's functions in a `try {} catch {}`.
 *
 * ```js
 * try {
 *     // calls a cross-origin script that doesn't have ACAO
 *     runThirdPartyCode();
 * } catch (e) {
 *     // report on error with e.message and e.stack
 * }
 * ```
 *
 * If `runThirdPartyCode()` causes any errors, the `catch {}` handler will get the full
 * details of the exception.
 *
 * Unfortunately this won't work for functions that are executed in the third-party
 * script as a result of browser events or callbacks (since you're not wrapping them).
 *
 * When using Boomerang to monitor JavaScript errors, Boomerang automatically wraps some
 * of the built-in browser APIs such as `setTimeout`, `setInterval` and `addEventListener`
 * with a minimal-overhead wrapper.  It does this to help ensure as many cross-origin
 * exceptions as possible have full stack details. You may also do this manually via
 * [`` BOOMR.plugin.Errors.wrap(function)``](#BOOMR_plugin_Errors_wrap).
 *
 * ## Why is Boomerang in my Error Stack?
 *
 * When looking at error reports, you may find errors that have a function in
 * `boomerang.js` (or `/boomerang/`) on the stack.  Why is that?  Is Boomerang
 * causing errors on your site?
 *
 * One of the ways that Boomerang is able to monitor and measure your site's performance
 * is by _wrapping_ itself around some of the core browser APIs.  Boomerang only does
 * this in a few places, if absolutely necessary -- namely, when the browser doesn't
 * provide a native "monitoring" interface for something that needs to be tracked.
 *
 * One example is for `XMLHttpRequests`, as there are no browser APIs to monitor when
 * XHRs load.  To monitor XHRs, Boomerang swaps in its own `window.XMLHttpRequest`
 * object, wrapping around the native methods.  When an XHR is created (via `.open()`),
 * the lightweight Boomerang wrapper is executed first so it can log a start timestamp.
 * When the XHR finishes (via a `readyState` change), Boomerang can log the end
 * timestamp and report on the XHR's performance.
 *
 * Examples of Boomerang wrapping native methods include:
 *
 * * `XMLHttpRequest` if the XHR instrumentation is turned on
 * * `setTimeout` and `setInterval` if error tracking is turned on
 * * `console.error` if error tracking is turned on
 * * `addEventListener` and `removeEventListener` if error tracking is turned on
 *
 * All of these wrapped functions come into play when you see an error stack with
 * a `boomerang.js` function in it.
 *
 * Often, the `boomerang.js` function will be at the _bottom_ of the stack (the first
 * function called).  This does not mean Boomerang caused the error, merely that
 * the monitoring code was running before the error occurred.  The actual
 * error happens towards the _top_ of the stack -- the function that ran and threw
 * the exception.
 *
 * Let's look at some examples:
 *
 * ```
 * Cannot read property 'foo' of undefined at thirdPartyTwo (https://thirdparty.com/core.js:1:100)
 * at thirdPartyOne (https://thirdparty.com/core.js:1:101)
 * at runThirdParty (https://thirdparty.com/core.js:1:102)
 * at xhrCallback (http://website.com/site.js:2:200)
 * at XMLHttpRequest.send (https://mysite.com/boomerang.js:3:300)
 * ```
 *
 * In the above example, Boomerang is monitoring `XMLHttpRequests`.  An XHR was
 * loaded on the site, and during the XHR callback, an exception was thrown.  Even
 * though `/boomerang/` is listed here, the error was caused by code in the XHR
 * callback (`xhrCallback` eventually calling `thirdPartyTwo`).
 *
 * Here's a second example:
 *
 * ```
 * Reference error: a is not defined at setTimeout (http://website.com/site.js:1:200)
 * at BOOMR_plugins_errors_wrap (http://mysite.com/boomerang.js:3:300)
 * at onclick (http://website.com/site.js:1:100)
 * ```
 *
 * In the above example, JavaScript Error Reporting is enabled and an exception was
 * thrown in a `setTimeout()` on the website.  You can see the `BOOMR_plugins_errors_wrap`
 * function is near the top of the stack, but this is merely the error tracking code.
 * All it did was wrap `setTimeout` to help ensure that cross-origin exceptions are
 * caught.  It was not the actual cause of the site's error.
 *
 * Here's a third example:
 *
 * ```
 * Error: missing argument 1 at BOOMR.window.console.error (https://mysite.com/boomerang.js:3:300)
 * at u/< (https://website.com/site.js:1:100)
 * at tp/this.$get</< (https://website.com/site.js:1:200)
 * at $digest (https://website.com/site.js:1:300)
 * at $apply (https://website.com/site.js:1:400)
 * at ut (https://website.com/site.js:1:500)
 * at it (https://website.com/site.js:1:600)
 * at vp/</k.onload (https://website.com/site.js:1:700)
 * ```
 *
 * In the above example, JavaScript Error Reporting is enabled and has wrapped
 * `console.error`.  The minified function `u/<` must be logging a `console.error`,
 * which executes the Boomerang wrapper code, reporting the error.
 *
 * In summary, if you see Boomerang functions in error stacks similar to any of the
 * ones listed below, it's probable that you're just seeing a side-effect of the
 * monitoring code:
 *
 * * `BOOMR_addError`
 * * `BOOMR_plugins_errors_onerror`
 * * `BOOMR_plugins_errors_onxhrerror`
 * * `BOOMR_plugins_errors_console_error`
 * * `BOOMR_plugins_errors_wrap`
 * * `BOOMR.window.console.error`
 * * `BOOMR_plugins_errors_onrejection`
 *
 * ## Beacon Parameters
 *
 * * `err`: The compressed error data structure
 * * `http.initiator = error` (if not part of a Page Load beacon)
 *
 * The compressed error data structure is a [JSURL](https://github.com/Sage/jsurl)
 * encoded JSON object.
 *
 * Each element in the array is a compressed representation of a JavaScript error:
 *
 * * `n`: Count (if the error was seen more than once)
 * * `f[]`: An array of frames
 *   * `f[].l`: Line number
 *   * `f[].c`: Colum number
 *   * `f[].f`: Function name
 *   * `f[].w`: File name (if origin differs from root page)
 *   * `f[].wo`: File name without origin (if same as root page)
 * * `s`: Source:
 *   * `1`: Error was triggered by the application
 *   * `2`: Error was triggered by Boomerang
 * * `v`: Via
 *   * `1`: Application ({@link BOOMR.plugins.Errors.send})
 *   * `2`: Global exception handler (`window.onerror`)
 *   * `3`: Network (XHR) error
 *   * `4`: Console (`console.error`)
 *   * `5`: Event handler (`addEventListener`)
 *   * `6`: `setTimeout` or `setInterval`
 * * `t`: Type (e.g. `SyntaxError` or `ReferenceError`)
 * * `c`: Code (for network errors)
 * * `m`: Error messag
 * * `x`: Extra data
 * * `d`: Timestamp (base 36)
 *
 * @class BOOMR.plugins.Errors
 */

/*eslint-disable*/
//
// Via https://github.com/stacktracejs/error-stack-parser
// Modifications:
// * Removed UMD
// * Return anonymous objects, not StackFrames
//
(function (root, factory) {
	'use strict';
	root.ErrorStackParser = factory();
}(this, function ErrorStackParser() {
	'use strict';

	var FIREFOX_SAFARI_STACK_REGEXP = /(^|@)\S+\:\d+/;
	var CHROME_IE_STACK_REGEXP = /^\s*at .*(\S+\:\d+|\(native\))/m;
	var SAFARI_NATIVE_CODE_REGEXP = /^(eval@)?(\[native code\])?$/;

	function _map(array, fn, thisArg) {
		if (typeof Array.prototype.map === 'function') {
			return array.map(fn, thisArg);
		} else {
			var output = new Array(array.length);
			for (var i = 0; i < array.length; i++) {
				output[i] = fn.call(thisArg, array[i]);
			}
			return output;
		}
	}

	function _filter(array, fn, thisArg) {
		if (typeof Array.prototype.filter === 'function') {
			return array.filter(fn, thisArg);
		} else {
			var output = [];
			for (var i = 0; i < array.length; i++) {
				if (fn.call(thisArg, array[i])) {
					output.push(array[i]);
				}
			}
			return output;
		}
	}

	return {
		/**
		 * Given an Error object, extract the most information from it.
		 * @param error {Error}
		 * @return Array[]
		 * @ignore
		 */
		parse: function ErrorStackParser$$parse(error) {
			if (typeof error.stacktrace !== 'undefined' || typeof error['opera#sourceloc'] !== 'undefined') {
				return this.parseOpera(error);
			} else if (error.stack && error.stack.match(CHROME_IE_STACK_REGEXP)) {
				return this.parseV8OrIE(error);
			} else if (error.stack) {
				return this.parseFFOrSafari(error);
			} else {
				throw new Error('Cannot parse given Error object');
			}
		},

		/**
		 * Separate line and column numbers from a URL-like string.
		 * @param urlLike String
		 * @return Array[String]
		 * @ignore
		 */
		extractLocation: function ErrorStackParser$$extractLocation(urlLike) {
			// Fail-fast but return locations like "(native)"
			if (urlLike.indexOf(':') === -1) {
				return [urlLike];
			}

			var locationParts = urlLike.replace(/[\(\)\s]/g, '').split(':');
			var lastNumber = locationParts.pop();
			var possibleNumber = locationParts[locationParts.length - 1];
			if (!isNaN(parseFloat(possibleNumber)) && isFinite(possibleNumber)) {
				var lineNumber = locationParts.pop();
				return [locationParts.join(':'), lineNumber, lastNumber];
			} else {
				return [locationParts.join(':'), lastNumber, undefined];
			}
		},

		parseV8OrIE: function ErrorStackParser$$parseV8OrIE(error) {
			var filtered = _filter(error.stack.split('\n'), function (line) {
				return !!line.match(CHROME_IE_STACK_REGEXP);
			}, this);

			return _map(filtered, function (line) {
				if (line.indexOf('(eval ') > -1) {
					// Throw away eval information until we implement stacktrace.js/stackframe#8
					line = line.replace(/eval code/g, 'eval').replace(/(\(eval at [^\()]*)|(\)\,.*$)/g, '');
				}
				var tokens = line.replace(/^\s+/, '').replace(/\(eval code/g, '(').split(/\s+/).slice(1);
				var locationParts = this.extractLocation(tokens.pop());
				var functionName = tokens.join(' ') || undefined;
				var fileName = locationParts[0] === 'eval' ? undefined : locationParts[0];

				return {
					functionName: functionName,
					fileName: fileName,
					lineNumber: locationParts[1],
					columnNumber: locationParts[2],
					source: line
				};
			}, this);
		},

		parseFFOrSafari: function ErrorStackParser$$parseFFOrSafari(error) {
			var filtered = _filter(error.stack.split('\n'), function (line) {
				return !line.match(SAFARI_NATIVE_CODE_REGEXP);
			}, this);

			return _map(filtered, function (line) {
				// Throw away eval information until we implement stacktrace.js/stackframe#8
				if (line.indexOf(' > eval') > -1) {
					line = line.replace(/ line (\d+)(?: > eval line \d+)* > eval\:\d+\:\d+/g, ':$1');
				}

				if (line.indexOf('@') === -1 && line.indexOf(':') === -1) {
					// Safari eval frames only have function names and nothing else
					return { functionName: line };
				} else {
					var tokens = line.split('@');
					var locationParts = this.extractLocation(tokens.pop());
					var functionName = tokens.join('@') || undefined;
					return {
						functionName: functionName,
						fileName: locationParts[0],
						lineNumber: locationParts[1],
						columnNumber: locationParts[2],
						source: line
					};
				}
			}, this);
		},

		parseOpera: function ErrorStackParser$$parseOpera(e) {
			if (!e.stacktrace || (e.message.indexOf('\n') > -1 &&
				e.message.split('\n').length > e.stacktrace.split('\n').length)) {
				return this.parseOpera9(e);
			} else if (!e.stack) {
				return this.parseOpera10(e);
			} else {
				return this.parseOpera11(e);
			}
		},

		parseOpera9: function ErrorStackParser$$parseOpera9(e) {
			var lineRE = /Line (\d+).*script (?:in )?(\S+)/i;
			var lines = e.message.split('\n');
			var result = [];

			for (var i = 2, len = lines.length; i < len; i += 2) {
				var match = lineRE.exec(lines[i]);
				if (match) {
					result.push({
						fileName: match[2],
						lineNumber: match[1],
						source: lines[i]
					});
				}
			}

			return result;
		},

		parseOpera10: function ErrorStackParser$$parseOpera10(e) {
			var lineRE = /Line (\d+).*script (?:in )?(\S+)(?:: In function (\S+))?$/i;
			var lines = e.stacktrace.split('\n');
			var result = [];

			for (var i = 0, len = lines.length; i < len; i += 2) {
				var match = lineRE.exec(lines[i]);
				if (match) {
					result.push({
						functionName: match[3] || undefined,
						fileName: match[2],
						lineNumber: match[1],
						source: lines[i]
					});
				}
			}

			return result;
		},

		// Opera 10.65+ Error.stack very similar to FF/Safari
		parseOpera11: function ErrorStackParser$$parseOpera11(error) {
			var filtered = _filter(error.stack.split('\n'), function (line) {
				return !!line.match(FIREFOX_SAFARI_STACK_REGEXP) &&
					!line.match(/^Error created at/);
			}, this);

			return _map(filtered, function (line) {
				var tokens = line.split('@');
				var locationParts = this.extractLocation(tokens.pop());
				var functionCall = (tokens.shift() || '');
				var functionName = functionCall
						.replace(/<anonymous function(: (\w+))?>/, '$2')
						.replace(/\([^\)]*\)/g, '') || undefined;
				var argsRaw;
				if (functionCall.match(/\(([^\)]*)\)/)) {
					argsRaw = functionCall.replace(/^[^\(]+\(([^\)]*)\)$/, '$1');
				}
				var args = (argsRaw === undefined || argsRaw === '[arguments not available]') ? undefined : argsRaw.split(',');
				return {
					functionName: functionName,
					args: args,
					fileName: locationParts[0],
					lineNumber: locationParts[1],
					columnNumber: locationParts[2],
					source: line
				};
			}, this);
		}
	};
}));
/*eslint-enable*/

/**
 * Boomerang Error plugin
 */
(function() {
	var impl;




	if (BOOMR.plugins.Errors) {
		return;
	}

	//
	// Constants
	//

	/**
	 * Functions to strip from any stack (internal functions)
	 */
	var STACK_FUNCTIONS_REMOVE = [
		"BOOMR_addError",
		"createStackForSend",
		"BOOMR.window.console.error",
		"BOOMR.plugins.Errors.init",
		"BOOMR.window.onerror",
		// below matches multiple functions:
		"BOOMR_plugins_errors_"
	];

	// functions to strip if they match a STACK_FILENAME_MATCH
	var STACK_FUNCTIONS_REMOVE_IF_FILENAME_MATCH = [
		"Object.send",
		"b.send",
		"wrap",
		"Anonymous function"
	];

	// files that will match for STACK_FUNCTIONS_REMOVE_IF_FILENAME_MATCH
	var STACK_FILENAME_MATCH = [
		"/boomerang"
	];

	/**
	 * Maximum size, in characters, of stack to capture
	 */
	var MAX_STACK_SIZE = 5000;

	/**
	 * BoomerangError object
	 *
	 * @param {object} config Configuration
	 */
	function BoomerangError(config) {
		config = config || {};

		// how many times we've seen this error
		if (typeof config.count === "number" || typeof config.count === "string") {
			this.count = parseInt(config.count, 10);
		}
		else {
			this.count = 1;
		}

		if (typeof config.timestamp === "number") {
			this.timestamp = config.timestamp;
		}
		else {
			 this.timestamp = BOOMR.now();
		}

		// merge in properties from config
		if (typeof config.code === "number" || typeof config.code === "string") {
			this.code = parseInt(config.code, 10);
		}

		if (typeof config.message === "string") {
			this.message = config.message;
		}

		if (typeof config.functionName === "string") {
			this.functionName = config.functionName;
		}

		if (typeof config.fileName === "string") {
			this.fileName = config.fileName;
		}

		if (typeof config.lineNumber === "number" || typeof config.lineNumber === "string") {
			this.lineNumber = parseInt(config.lineNumber, 10);
		}

		if (typeof config.columnNumber === "number" || typeof config.columnNumber === "string") {
			this.columnNumber = parseInt(config.columnNumber, 10);
		}

		if (typeof config.stack === "string") {
			this.stack = config.stack;
		}

		if (typeof config.type === "string") {
			this.type = config.type;
		}

		if (typeof config.extra !== "undefined") {
			this.extra = config.extra;
		}

		this.source = (typeof config.source === "number" || typeof config.source === "string") ?
			parseInt(config.source, 10) :
			BOOMR.plugins.Errors.SOURCE_APP;

		if (typeof config.via === "number" || typeof config.via === "string") {
			this.via = parseInt(config.via, 10);
		}

		if (BOOMR.utils.isArray(config.frames)) {
			this.frames = config.frames;
		}
		else {
			this.frames = [];
		}

		if (BOOMR.utils.isArray(config.events)) {
			this.events = config.events;
		}
		else {
			this.events = [];
		}
	}

	/**
	 * Determines if one BoomerangError object is equal to another
	 *
	 * @param {object} other Object to compare to
	 *
	 * @returns {boolean} True if the two objects are logically equal errors
	 */
	BoomerangError.prototype.equals = function(other) {
		if (typeof other !== "object") {
			return false;
		}
		else if (this.code !== other.code) {
			return false;
		}
		else if (this.message !== other.message) {
			return false;
		}
		else if (this.functionName !== other.functionName) {
			return false;
		}
		else if (this.fileName !== other.fileName) {
			return false;
		}
		else if (this.lineNumber !== other.lineNumber) {
			return false;
		}
		else if (this.columnNumber !== other.columnNumber) {
			return false;
		}
		else if (this.stack !== other.stack) {
			return false;
		}
		else if (this.type !== other.type) {
			return false;
		}
		else if (this.source !== other.source) {
			return false;
		}
		else {
			// same!
			return true;
		}
	};

	/**
	 * Creates a BoomerangError from an Error
	 *
	 * @param {Error} error Error object
	 * @param {number} via How the Error was found (VIA_* enum)
	 * @param {number} source Source of the error (SOURCE_* enum)
	 *
	 * @returns {BoomerangError} Error
	 */
	BoomerangError.fromError = function(error, via, source) {
		var frame, frames, lastFrame, forceUpdate = false, i, j, k,
		    now = BOOMR.now(), skipThis, thisFrame, thisFn;

		if (!error) {
			return null;
		}

		// parse the stack
		if (error.stack) {
			if (error.stack.length > MAX_STACK_SIZE) {
				error.stack = error.stack.substr(0, MAX_STACK_SIZE);
			}

			frames = ErrorStackParser.parse(error);
			if (frames && frames.length) {
				if (error.generatedStack) {
					// if we generated the stack (we were only given a message),
					// we should remove our stack-generation function from it

					// fix-up stack generation on Chrome
					if (frames.length >= 4 &&
						frames[1].functionName &&
						frames[1].functionName.indexOf("createStackForSend") !== -1) {
						// remove the top 3 frames
						frames = frames.slice(3);
						forceUpdate = true;
					}

					// fix-up stack generation on Firefox
					if (frames.length >= 3 &&
						frames[0].functionName &&
						frames[0].functionName.indexOf("createStackForSend") !== -1) {
						// check to see if the filename of frames two and 3 are the same (boomerang),
						// if so, remove both
						if (frames[1].fileName === frames[2].fileName) {
							// remove the top 3 frames
							frames = frames.slice(3);
						}
						else {
							// remove the top 2 frames
							frames = frames.slice(2);
						}

						forceUpdate = true;
					}

					// strip other stack generators
					if (frames.length >= 1 &&
						frames[0].functionName &&
						frames[0].functionName.indexOf("BOOMR_plugins_errors") !== -1) {
						frames = frames.slice(1);
						forceUpdate = true;
					}
				}

				// remove our error wrappers from the stack
				for (i = 0; i < frames.length; i++) {
					thisFrame = frames[i];
					thisFn = thisFrame.functionName;
					skipThis = false;

					// strip boomerang function names
					if (thisFn) {
						for (j = 0; j < STACK_FUNCTIONS_REMOVE.length; j++) {
							if (thisFn.indexOf(STACK_FUNCTIONS_REMOVE[j]) !== -1) {
								frames.splice(i, 1);
								forceUpdate = true;

								// outloop continues with the next element
								i--;
								skipThis = true;
								break;
							}
						}

						// strip additional functions if they also match a file
						if (!skipThis && thisFrame.fileName) {
							for (j = 0; j < STACK_FILENAME_MATCH.length; j++) {
								if (thisFrame.fileName.indexOf(STACK_FILENAME_MATCH[j]) !== -1) {
									// this file name matches, see if any of the matching functions also do
									for (k = 0; k < STACK_FUNCTIONS_REMOVE_IF_FILENAME_MATCH.length; k++) {
										if (thisFn.indexOf(STACK_FUNCTIONS_REMOVE_IF_FILENAME_MATCH[k]) !== -1) {
											frames.splice(i, 1);
											forceUpdate = true;

											// outloop continues with the next element
											i--;
											skipThis = true;
											break;
										}
									}
								}
							}
						}
					}
				}

				if (frames.length) {
					// get the top frame
					frame = frames[0];

					// fill in our error with the top frame, if not already specified
					if (forceUpdate || typeof error.lineNumber === "undefined") {
						error.lineNumber = frame.lineNumber;
					}

					if (forceUpdate || typeof error.columnNumber === "undefined") {
						error.columnNumber = frame.columnNumber;
					}

					if (forceUpdate || typeof error.functionName === "undefined") {
						error.functionName = frame.functionName;
					}

					if (forceUpdate || typeof error.fileName === "undefined") {
						error.fileName = frame.fileName;
					}
				}

				// trim stack down
				if (error.stack) {
					// remove double-spaces
					error.stack = error.stack.replace(/\s\s+/g, " ");
				}
			}
		}
		else if (error.functionName ||
			error.fileName ||
			error.lineNumber ||
			error.columnNumber) {
			// reconstruct a single frame if given fileName, etc
			frames = [{
				lineNumber: error.lineNumber,
				columnNumber: error.columnNumber,
				fileName: error.fileName,
				functionName: error.functionName
			}];
		}

		// fixup some old browser types
		if (typeof error.message === "string" &&
		    error.message.indexOf("ReferenceError:") !== -1 &&
		    error.name === "Error") {
			error.name = "ReferenceError";
		}

		// create our final object
		var err = new BoomerangError({
			code: error.code ? error.code : undefined,
			message: error.message ? error.message : undefined,
			functionName: error.functionName ? error.functionName : undefined,
			fileName: error.fileName ? error.fileName : undefined,
			lineNumber: error.lineNumber ? error.lineNumber : undefined,
			columnNumber: error.columnNumber ? error.columnNumber : undefined,
			stack: error.stack ? error.stack : undefined,
			type: error.name ? error.name : undefined,
			source: source,
			via: via,
			frames: frames,
			extra: error.extra ? error.extra : undefined,
			timestamp: error.timestamp ? error.timestamp : now
		});

		return err;
	};

	//
	// Internal config
	//
	impl = {
		//
		// Configuration
		//

		// overridable
		onError: undefined,
		monitorGlobal: true,
		monitorNetwork: true,
		monitorConsole: true,
		monitorEvents: true,
		monitorTimeout: true,
		monitorRejections: false,  // new feature, off by default
		monitorReporting: false,  // new feature, off by default
		sendAfterOnload: false,
		maxErrors: 10,
		// How often to send an error beacon after onload
		sendInterval: 1000,
		// How often to send a beacon during onload if autorun=false
		sendIntervalDuringLoad: 2500,
		sendIntervalId: -1,
		maxEvents: 10,

		// state
		isDuringLoad: true,
		initialized: false,
		autorun: true,

		/**
		 * All errors
		 */
		errors: [],

		/**
		 * Errors queued up for the next batch
		 */
		q: [],

		/**
		 * Circular event buffer
		 */
		events: [],

		// Reporting API observer
		reportingObserver: undefined,

		//
		// Public Functions
		//
		/**
		 * Sends an error
		 *
		 * @param {Error|String} error Error object or message
		 *
		 * @memberof BOOMR.plugins.Errors
		 */
		send: function(error, via, source) {
			var now = BOOMR.now();

			if (!error) {
				return;
			}

			// check if this error was already sent.
			// This could happen if an event handler caught it and then the global
			// error handler caught it again.
			if (error.reported === true) {
				return;
			}
			error.reported = true;

			// defaults, if not specified
			via = via || BOOMR.plugins.Errors.VIA_APP;
			source = source ||  BOOMR.plugins.Errors.SOURCE_APP;

			// if we weren't given a stack, try to create one
			if (!error.stack && !error.noStack) {
				// run this in a function so we can detect it easier by the name,
				// and remove it from any stack frames we send
				function createStackForSend() {
					try {
						throw Error(error);
					}
					catch (ex) {
						error = ex;

						// note we generated this stack for later
						error.generatedStack = true;

						// set the time when it was created
						error.timestamp = error.timestamp || now;

						impl.addError(error, via, source);
					}
				}

				createStackForSend();
			}
			else {
				// add the timestamp
				error.timestamp = error.timestamp || now;

				// send (or queue) the error
				impl.addError(error, via, source);
			}
		},

		//
		// Private Functions
		//

		/**
		 * Sends (or queues) errors
		 *
		 * @param {Error} error Error
		 * @param {number} via VIA_* constant
		 * @param {number} source SOURCE_* constant
		 */
		addError: function(error, via, source) {
			var onErrorResult, err, dup = false, now = BOOMR.now();

			// only track post-load errors if configured
			if (!impl.isDuringLoad && !impl.sendAfterOnload) {
				return;
			}

			// allow the user to filter out the error
			if (impl.onError) {
				try {
					onErrorResult = impl.onError(error);
				}
				catch (exc) {
					onErrorResult = false;
				}

				if (!onErrorResult) {
					return;
				}
			}

			// obey the errors limit
			if (impl.errors.length >= impl.maxErrors) {
				return;
			}

			// convert into our object
			err = BoomerangError.fromError(error, via, source);
      // console.log( BoomerangError );
      // console.log( via );
      // console.log( source );
      // // BOOMR.plugins.Errors.BoomerangError()
      // console.log(err);
			// add to our list of errors seen for all time
			dup = impl.mergeDuplicateErrors(impl.errors, err, false);

			// fire an error event with the duped or new error
			BOOMR.fireEvent("error", dup || err);

			// add to our current queue
			impl.mergeDuplicateErrors(impl.q, err, true);

			//
			// There are a few reasons we'll send an error beacon on its own:
			// 1. If this is after onload, and sendAfterOnload is set.
			// 2. If this is during onload, but autorun is false.  In that case,
			//    we want to send out errors (after a small delay) in case the
			//    page never loads (e.g. due to the error).
			//
			if ((BOOMR.hasSentPageLoadBeacon() || !impl.autorun) && impl.sendIntervalId === -1) {
				if (dup) {
					// If this is not during a load, and it's a duplicate of
					// a previous error, don't send a beacon just for itself
					return;
				}

				// errors outside of a load will be sent at the next interval
				impl.sendIntervalId = setTimeout(function() {
					impl.sendIntervalId = -1;

					// Don't send a beacon if we've already flushed the queue.  This
					// might happen for pre-onload becaons if the onload beacon was
					// sent after queueing
					if (impl.q.length === 0) {
						return;
					}

					// Queue a beacon whenever there isn't another one ongoing
					BOOMR.sendBeaconWhenReady(
						{
							// change this to an 'error' beacon
							"rt.start": "manual",
							"http.initiator": "error",

							// set it as an API beacon, which means it won't have any timing data
							"api": 1,

							// when
							"rt.tstart": now,
							"rt.end": now
						},
						function() {
							// add our errors to the beacon when ready
							impl.addErrorsToBeacon();
						},
						this);
				}, impl.isDuringLoad ? impl.sendIntervalDuringLoad : impl.sendInterval);
			}
		},

		/**
		 * Finds a duplicate BoomerangErrors in the specified array
		 *
		 * @param {Array[]} errors Array of BoomerangErrors
		 * @param {BoomerangError} err BoomerangError to check
		 *
		 * @returns {BoomerangError} BoomerangErrors that was duped against, if any
		 */
		findDuplicateError: function(errors, err) {
			if (!BOOMR.utils.isArray(errors) || typeof err === "undefined") {
				return undefined;
			}

			for (var i = 0; i < errors.length; i++) {
				if (errors[i].equals(err)) {
					return errors[i];
				}
			}

			return undefined;
		},

		/**
		 * Merges duplicate BoomerangErrors
		 *
		 * @param {Array[]} errors Array of BoomerangErrors
		 * @param {BoomerangError} err BoomerangError to check
		 * @param {boolean} bumpCount Increment the count of any found duplicates
		 *
		 * @returns {BoomerangError} BoomerangErrors that was duped against, if any
		 */
		mergeDuplicateErrors: function(errors, err, bumpCount) {
			if (!BOOMR.utils.isArray(errors) || typeof err === "undefined") {
				return undefined;
			}

			var dup = impl.findDuplicateError(errors, err);
			if (dup) {
				if (bumpCount) {
					dup.count += err.count;
				}

				return dup;
			}
			else {
				errors.push(err);
				return undefined;
			}
		},

		/**
		 * Fired 'beacon'
		 */
		onBeacon: function() {
			// remove our err vars
			BOOMR.removeVar("err");
			BOOMR.removeVar("api");
			BOOMR.removeVar("http.initiator");
		},

		/**
		 * Fired on 'page_ready'
		 */
		pageReady: function() {
			impl.isDuringLoad = false;
		},

		/**
		 * Retrieves the current errors
		 *
		 * @returns {BoomerangError[]}
		 */
		getErrors: function() {
			if (impl.errors.length === 0) {
				return false;
			}

			return impl.errors;
		},

		/**
		 * Gets errors suitable for transmission in a URL
		 *
		 * @param {BoomerangError[]} errors BoomerangErrors array
		 *
		 * @returns {string} String for URL
		 */
		getErrorsForUrl: function(errors) {
			errors = impl.compressErrors(errors);
			return BOOMR.utils.serializeForUrl(errors);
		},

		/**
		 * Adds any queue'd errors to the beacon
		 */
		addErrorsToBeacon: function() {
			if (impl.q.length) {
				var err = this.getErrorsForUrl(impl.q);
				if (err) {
					BOOMR.addVar("err", err);
				}

				impl.q = [];
			}
		},

		/**
		 * Fired 'before_beacon'
		 */
		beforeBeacon: function() {
			impl.addErrorsToBeacon();
		},

		/**
		 * Wraps calls to functionName in an exception handler that will
		 * automatically report exceptions.
		 *
		 * @param {string} functionName Function name
		 * @param {object} that Target object
		 * @param {boolean} useCallingObject Whether or not to use the calling object for 'this'
		 * @param {number} callbackIndex Which argument is the callback
		 * @param {number} via Via
		 */
		wrapFn: function(functionName, that, useCallingObject, callbackIndex, via) {
			var origFn = that[functionName];

			if (typeof origFn !== "function") {
				return;
			}

			var rEL;
			if (functionName === "addEventListener") {
				// grab the native
				rEL = that.removeEventListener;
			}

			BOOMR.utils.overwriteNative(that, functionName, function BOOMR_plugins_errors_wrapped_function() {
				try {
					var args = Array.prototype.slice.call(arguments);
					var callbackFn = args[callbackIndex];

					// Determine the calling object: if 'this' is the Boomerang frame, we should swap it
					// to the correct top level window context.  If Boomerang isn't running in a frame,
					// BOOMR.window will still point to the top-level window.
					var targetObj = useCallingObject ? (this === window ? BOOMR.window : this) : that;
					var wrappedFn = impl.wrap(callbackFn, targetObj, via);

					args[callbackIndex] = wrappedFn;

					if (functionName === "addEventListener") {
						// For removeEventListener we need to keep track of this
						// unique tuple of target object, event name (arg0), original function
						// and capture (arg2)
						// Since we wrap the origFn with a new anonymous function we can't rely on
						// the browser's addEventListener to dedup multiple additions of the same
						// callback.
						if (!impl.trackFn(targetObj, args[0], callbackFn, args[2], wrappedFn)) {
							// if the callback is already tracked, we won't call addEventListener
							return;
						}

						if (rEL) {
							// Remove the listener before adding it back in.
							// This takes care of the (pathological) case where code is relying on the native
							// de-dupping that the browser provides and BOOMR instruments `addEventListener` between
							// their redundant calls to `addEventListener`.
							// We detach with the native because there's no point in calling our wrapped version.
							rEL.apply(targetObj, arguments);
						}
					}

					return origFn.apply(targetObj, args);
				}
				catch (e) {
					// error during original callback setup
					impl.send(e, via);

					// re-throw
					throw e;
				}
			});
		},

		/**
		 * Tracks the specified function for removeEventListener.
		 *
		 * @param {object} target Target element (window, element, etc)
		 * @param {string} type Event type (name)
		 * @param {function} listener Original listener
		 * @param {boolean|object} useCapture|options Use capture flag or options object
		 * @param {function} wrapped Wrapped function
		 *
		 * @returns {boolean} `true` if function is not already tracked, false otherwise
		 */
		trackFn: function(target, type, listener, useCapture, wrapped) {
			if (!target) {
				return false;
			}

			if (impl.trackedFnIdx(target, type, listener, useCapture) !== -1) {
				// already tracked
				return false;
			}

			if (!target._bmrEvents) {
				target._bmrEvents = [];
			}

			// 3rd argment can be useCapture flag or options object that may contain a `capture` key.
			// Default is false in both cases
			useCapture = (useCapture && useCapture.capture || useCapture) === true;

			target._bmrEvents.push([type, listener, useCapture, wrapped]);
			return true;
		},

		/**
		 * Gets the index of the tracked function.
		 *
		 * @param {object} target Target element (window, element, etc)
		 * @param {string} type Event type (name)
		 * @param {function} listener Original listener
		 * @param {boolean|object} useCapture|options Use capture flag or options object
		 *
		 * @returns {number} Index of already tracked function, or -1 if it doesn't exist
		 */
		trackedFnIdx: function(target, type, listener, useCapture) {
			var i, f;

			if (!target) {
				return;
			}

			if (!target._bmrEvents) {
				target._bmrEvents = [];
			}

			// 3rd argment can be useCapture flag or options object that may contain a `capture` key.
			// Default is false in both cases
			useCapture = (useCapture && useCapture.capture || useCapture) === true;

			for (i = 0; i < target._bmrEvents.length; i++) {
				f = target._bmrEvents[i];
				if (f[0] === type &&
				    f[1] === listener &&
				    f[2] === useCapture) {
					return i;
				}
			}

			return -1;
		},

		/**
		 * Wraps removeEventListener to work with our wrapFn
		 *
		 * @param {object} that Target object
		 */
		wrapRemoveEventListener: function(that) {
			var fn = "removeEventListener", origFn = that[fn], idx, wrappedFn;

			if (typeof origFn !== "function") {
				return;
			}

			BOOMR.utils.overwriteNative(that, fn, function BOOMR_plugins_errors_wrapped_removeEventListener(type, listener, useCapture) {
				var targetObj = this === window ? BOOMR.window : this;

				idx = impl.trackedFnIdx(targetObj, type, listener, useCapture);

				if (idx !== -1) {
					wrappedFn = targetObj._bmrEvents[idx][3];

					// remove our wrapped function instead
					origFn.call(targetObj, type, wrappedFn, useCapture);

					// remove bookkeeping
					targetObj._bmrEvents.splice(idx, 1);
				}
				else {
					// unknown, pass original args
					origFn.call(targetObj, type, listener, useCapture);
				}
			});
		},

		/**
		 * Wraps the function in an exception handler that will
		 * automatically report exceptions.
		 *
		 * @param {function} fn Function
		 * @param {object} that Target object
		 * @param {number} via Via (optional)
		 *
		 * @returns {function} Wrapped function
		 *
		 * @memberof BOOMR.plugins.Errors
		 */
		wrap: function(fn, that, via) {
			if (typeof fn !== "function") {
				// Return the input argument as-is.  This might happen if the argument
				// to setTimeout/setInterval is a string, which is deprecated but supported
				// by all browsers, however it isn't something we can wrap (we don't want to have
				// eval statements in the code).
				return fn;
			}

			via = via || BOOMR.plugins.Errors.VIA_APP;

			// ensure the document.domain is OK before we wrap the function
			BOOMR_check_doc_domain();

			return function BOOMR_plugins_errors_wrap() {
				try {
					return fn.apply(that, arguments);
				}
				catch (e) {
					// Check for IE/Edge error "Can't execute code from freed script"
					if (e.number === -2146823277 &&
						(via === BOOMR.plugins.Errors.VIA_EVENTHANDLER || via === BOOMR.plugins.Errors.VIA_TIMEOUT)) {
						// Event listeners that reference freed scripts don't generate errors in IE
						// Our call to a freed script does though, don't report the error
						return;
					}

					if (!BOOMR.isUnloaded) {
						// Report error during callback
						impl.send(e, via);
					}

					// re-throw
					throw e;
				}
			};
		},

		/**
		 * Runs the function, watching for exceptions
		 *
		 * @param {function} fn Function
		 * @param {object} that Target object
		 * @param {object[]} args Arguments
		 *
		 * @memberof BOOMR.plugins.Errors
		 */
		test: function() {
			var fn, that, args;
			if (arguments.length === 0) {
				return undefined;
			}

			// the function to run is the first argument
			fn = arguments[0];
			if (typeof fn !== "function") {
				return undefined;
			}

			// the object is the second
			that = arguments.length > 1 ? arguments[1] : BOOMR.window;

			// additional arguments after
			var args = Array.prototype.slice.call(arguments, 2);

			// run the fn
			return impl.wrap(fn, that).apply(that, args);
		},

		/**
		 * Normalizes an object to a string
		 *
		 * @param {object} obj Object
		 * @returns {string} String version of the object
		 */
		normalizeToString: function(obj) {
			if (typeof obj === "undefined") {
				return "undefined";
			}
			else if (obj === null) {
				return "null";
			}
			else if (typeof obj === "number" && isNaN(obj)) {
				return "NaN";
			}
			else if (obj === "") {
				return "(empty string)";
			}
			else if (obj === 0) {
				return "0";
			}
			else if (!obj) {
				return "false";
			}
			else if (typeof obj === "function") {
				return "(function)";
			}
			else if (obj && typeof obj.toString === "function") {
				return obj.toString();
			}
			else {
				return "(unknown)";
			}
		},

		/**
		 * Compresses BoomerangErrors to a smaller properties for transmission
		 *
		 * count -> n if > 1
		 * frames -> f
		 * frames[].lineNumber -> f[].l
		 * frames[].columnNumber -> f[].c
		 * frames[].functionName -> f[].f
		 * frames[].fileName -> f[].w or .wo (stripped of root origin)
		 * events -> e
		 * events[].type -> e[].t
		 * events[].timestamp -> e[].d
		 * events[].[other] -> each type has its own data
		 * source -> s
		 * via -> v
		 * type -> t
		 * code -> c
		 * message -> m
		 * extra -> x
		 * events -> e
		 * timestamp -> d (base 36)
		 *
		 * stack, fileName, functionName, lineNumber and columnNumber are dropped
		 * since they're frame[0]
		 *
		 * @params {BoomerangError[]} errors Errors array
		 *
		 * @returns {BoomerangError[]} Compressed errors array
		 */
		compressErrors: function(errors) {
			var i, j, err, frame, evt, minFrame, minEvent, o, obj, timestamp = 0;

			// get the origin
			o = BOOMR.window.location.origin;

			// minimize the contents of each error
			for (i = 0; i < errors.length; i++) {
				err = errors[i];

				// we're going to create a new object with minimized property
				// names and values to reduce byte size
				obj = {};

				// 1-count is assumed
				if (err.count !== 1) {
					obj.n = err.count;
				}

				if (typeof err.timestamp === "number") {
					timestamp = err.timestamp;
					obj.d = err.timestamp.toString(36);
				}

				// frames
				if (err.frames.length) {
					obj.f = [];

					// compress all frames
					for (j = 0; j < err.frames.length; j++) {
						frame = err.frames[j];

						// encode numeric properties
						if (frame.lineNumber) {
							frame.lineNumber = parseInt(frame.lineNumber, 10);
						}

						if (frame.columnNumber) {
							frame.columnNumber = parseInt(frame.columnNumber, 10);
						}

						minFrame = {
							l: frame.lineNumber,
							c: frame.columnNumber
						};

						// drop origin from filename
						if (typeof frame.fileName === "string") {
							if (frame.fileName.indexOf(o) !== -1) {
								minFrame.wo = frame.fileName.replace(o, "");
							}
							else {
								minFrame.w = frame.fileName;
							}
						}

						if (typeof frame.functionName === "string") {
							minFrame.f = frame.functionName;
						}

						obj.f.push(minFrame);
					}
				}

				// don't copy events if there aren't any
				if (err.events.length) {
					obj.e = [];

					// compress all events
					for (j = 0; j < err.events.length; j++) {
						evt = err.events[j];

						minEvent = {
							t: evt.type,
							d: timestamp ? (timestamp - evt.timestamp) : evt.timestamp
						};

						// type-specific compression
						if (evt.type === BOOMR.plugins.Errors.EVENT_CLICK) {
							if (evt.id) {
								minEvent.i = evt.id;
							}

							if (evt.name) {
								minEvent.n = evt.name;
							}

							if (evt.tagName) {
								minEvent.g = evt.tagName;
							}
						}
						else if (evt.type === BOOMR.plugins.Errors.EVENT_NETWORK) {
							if (evt.url) {
								minEvent.u = evt.url;
							}

							if (evt.method) {
								minEvent.m = evt.method;
							}

							if (evt.result) {
								minEvent.r = evt.result;
							}
						}
						else if (evt.type === BOOMR.plugins.Errors.EVENT_LOG) {
							if (evt.severity) {
								minEvent.s = evt.severity;
							}

							if (evt.message) {
								minEvent.m = evt.message;
							}
						}

						obj.e.push(minEvent);
					}
				}

				// don't need to add these properties as they're in the first frame:
				// lineNumber
				// columnNumber
				// functionName
				// fileName

				//
				// Only copy non-default values
				//
				if (err.source !== BOOMR.plugins.Errors.SOURCE_APP) {
					obj.s = err.source;
				}

				if (typeof err.via !== "undefined" && err.via !== BOOMR.plugins.Errors.VIA_APP) {
					obj.v = err.via;
				}

				if (typeof err.type !== "undefined" && err.type !== "Error") {
					obj.t = err.type;
				}

				if (err.code) {
					obj.c = err.code;
				}

				if (err.message) {
					obj.m = err.message;
				}

				if (err.extra) {
					obj.x = err.extra;
				}

				// send minimized object
				errors[i] = obj;
			}

			return errors;
		}

	};

	//
	// Exports
	//
	var E = BOOMR.plugins.Errors = {
		/**
		 * Initializes the plugin.
		 *
		 * @param {object} config Configuration
		 * @param {function} [config.Errors.onError] Callback to fire when
		 * an error occurs
		 *
		 * @param {boolean} [config.Errors.monitorGlobal] Monitor `window.onerror`
		 * @param {boolean} [config.Errors.monitorNetwork] Monitor XHR errors
		 * @param {boolean} [config.Errors.monitorConsole] Monitor `console.error`
		 * @param {boolean} [config.Errors.monitorEvents] Monitor event callbacks
		 * (from `addEventListener`).
		 * @param {boolean} [config.Errors.monitorTimeout] Monitor `setTimout`
		 * and `setInterval`.
		 * @param {boolean} [config.Errors.monitorRejections] Monitor unhandled
		 * promise rejections.
		 * @param {boolean} [config.Errors.monitorReporting] Monitor Reporting API
		 * warnings.
		 * @param {boolean} [config.Errors.sendAfterOnload] Whether or not to
		 * send errors after the page load beacon.  If set to false, only errors
		 * that happened up to the page load beacon will be captured.
		 * @param {boolean} [config.Errors.sendInterval] If `sendAfterOnload` is
		 * true, how often to send the latest batch of errors.
		 * @param {number} [config.Errors.maxErrors] Maximum number of errors
		 * to track per page.
		 *
		 * @returns {@link BOOMR.plugins.Errors} The Errors plugin for chaining
		 * @memberof BOOMR.plugins.Errors
		 */

		init: function(config) {
			var i, report, msg;

			BOOMR.utils.pluginConfig(impl, config, "Errors",
				["onError", "monitorGlobal", "monitorNetwork", "monitorConsole",
				 "monitorEvents", "monitorTimeout", "monitorReporting", "monitorRejections",
				 "sendAfterOnload", "sendInterval", "maxErrors"]);

			if (impl.initialized) {
				return this;
			}

			if (config && typeof config.autorun !== "undefined") {
				impl.autorun = config.autorun;
			}

			impl.initialized = true;

			// subscribe to events
			BOOMR.subscribe("before_beacon", impl.beforeBeacon, null, impl);
			BOOMR.subscribe("beacon", impl.onBeacon, null, impl);
			BOOMR.subscribe("page_ready", impl.pageReady, null, impl);

			// register an event
			BOOMR.registerEvent("error");

			// hook into window.onError if configured
			if (impl.monitorGlobal) {
				try {
					// globalOnError might be set by loader snippet
					if (!BOOMR.globalOnError) {
						BOOMR.globalOnError = BOOMR.window.onerror;
					}
					else {
						// Another error wrapper came in after us - call this new onerror first.  Since
						// it presumably wrapped our original handler, that will likely be called but
						// will detect Boomerang has loaded and will call *its* original onerror handler.
						if (BOOMR.window.onerror && !BOOMR.window.onerror._bmr) {
							BOOMR.globalOnError = BOOMR.window.onerror;
						}
					}

					BOOMR.utils.overwriteNative(BOOMR.window, "onerror", function BOOMR_plugins_errors_onerror(message, fileName, lineNumber, columnNumber, error) {
						// onerror may be called with an `ErrorEvent` object (eg. https://github.com/angular/zone.js/issues/1108)
						if (typeof error === "undefined" &&
						    typeof message === "object" && typeof message.error === "object" && message.error !== null) {
							error = message.error;
						}

						// a SyntaxError can produce a null error
						if (typeof error !== "undefined" && error !== null) {
							impl.send(error, E.VIA_GLOBAL_EXCEPTION_HANDLER);
						}
						else {
							// older browsers will not send an error object to the global error handler making deduplication difficult.
							// If an error is caught and reported (eg. in an error wrapper of addEventListener or setTimeout) then it will
							// also be reported here.
							// We could possibly check that the last error in our queue did not arrive via the global error handler
							// and assume it was the same error but more testing will be required. We cannot compare the error message,
							// since the message of the original error and the one that is provided here will be different in some cases.
							impl.send({
								message: message,
								fileName: fileName,
								lineNumber: lineNumber,
								columnNumber: columnNumber,
								noStack: true
							}, E.VIA_GLOBAL_EXCEPTION_HANDLER);
						}

						if (typeof BOOMR.globalOnError === "function") {
							return BOOMR.globalOnError.apply(BOOMR.window, arguments);
						}

						return false; // don't prevent the firing of the default event handler
					});

					// send any errors from the loader snippet
					if (BOOMR.globalErrors) {
						for (var i = 0; i < BOOMR.globalErrors.length; i++) {
							impl.send(BOOMR.globalErrors[i], E.VIA_GLOBAL_EXCEPTION_HANDLER);
						}

						delete BOOMR.globalErrors;
					}
				}
				catch (e) {

				}
			}
			// listen for XHR errors
			if (impl.monitorNetwork) {
				BOOMR.subscribe("xhr_error", function BOOMR_plugins_errors_onxhrerror(resource) {
					console.log( resource );
					impl.send({
						code: resource.status,
						message: resource.url,
						noStack: true
					}, E.VIA_NETWORK);
				});
			}


			// listen for unhandled promise rejections
			if (impl.monitorRejections && BOOMR.window.PromiseRejectionEvent) {
				// add event listener instead of window.onunhandledrejection
				BOOMR.utils.addListener(BOOMR.window, "unhandledrejection", function BOOMR_plugins_errors_onrejection(event) {
					var stack, message = "Unhandled Promise Rejection";
					if (event && event.reason) {
						if (typeof event.reason === "string") {
							message = event.reason;
						}
						else {
							if (typeof event.reason.stack === "string") {
								stack = event.reason.stack;
							}
							if (typeof event.reason.message === "undefined") {
								message = impl.normalizeToString(event.reason);
							}
							else {
								message = impl.normalizeToString(event.reason.message);
							}
						}

						impl.send({
							message: message,
							stack: stack,
							noStack: stack ? false : true
						}, E.VIA_REJECTION);
					}
				}, true);
			}

			// listen for calls to console.error
			if (impl.monitorConsole) {
				if (!BOOMR.window.console) {
					BOOMR.window.console = {};
				}

				BOOMR.globalConsole = BOOMR.window.console.error;

				try {
					BOOMR.utils.overwriteNative(BOOMR.window.console, "error", function BOOMR_plugins_errors_console_error() {
						// get a copy of the args
						var args = Array.prototype.slice.call(arguments);

						if (args.length === 1) {
							// send just the first argument
							impl.send(impl.normalizeToString(args[0]), E.VIA_CONSOLE);
						}
						else {
							// get the array of arguments
							impl.send(impl.normalizeToString(args), E.VIA_CONSOLE);
						}

						if (typeof BOOMR.globalConsole === "function") {
							if (typeof BOOMR.globalConsole.apply === "function") {
								BOOMR.globalConsole.apply(this, args);
							}
							else {
								BOOMR.globalConsole(args[0], args[1], args[2]);
							}
						}
					});
				}
				catch (h) {

				}
			}

			// listen for errors in addEventListener callbacks
			if (impl.monitorEvents) {
				// EventTarget's addEventListener will catch events from window, document, Element and XHR in modern browsers.
				// We want to instrument addEventListener at the end of the protocol chain in order to avoid conflicts with
				// other libraries that might be wrapping AEL at a different level.
				// This pattern is safer since other libraries' wrappers will get called. The downside is that our wrapper
				// will not be called and any error in the AEL callback will be caught by the global error handler instead.
				if (BOOMR.window.EventTarget) {
					impl.wrapFn("addEventListener", BOOMR.window.EventTarget.prototype, true, 1, E.VIA_EVENTHANDLER);
					impl.wrapRemoveEventListener(BOOMR.window.EventTarget.prototype);
				}
				else {
					if (BOOMR.window) {
						impl.wrapFn("addEventListener", BOOMR.window, false, 1, E.VIA_EVENTHANDLER);
						impl.wrapRemoveEventListener(BOOMR.window);
					}

					if (BOOMR.window.Node) {
						impl.wrapFn("addEventListener", BOOMR.window.Node.prototype, true, 1, E.VIA_EVENTHANDLER);
						impl.wrapRemoveEventListener(BOOMR.window.Node.prototype);
					}

					if (BOOMR.window.XMLHttpRequest) {
						impl.wrapFn("addEventListener", BOOMR.window.XMLHttpRequest.prototype, true, 1, E.VIA_EVENTHANDLER);
						impl.wrapRemoveEventListener(BOOMR.window.XMLHttpRequest.prototype);
					}
				}
			}

			// listen for errors in timeout callbacks
			if (impl.monitorTimeout) {
				impl.wrapFn("setTimeout", BOOMR.window, false, 0, E.VIA_TIMEOUT);
				impl.wrapFn("setInterval", BOOMR.window, false, 0, E.VIA_TIMEOUT);
			}

			// listen for Reporting API warnings
			if (impl.monitorReporting && BOOMR.window.ReportingObserver) {
				impl.reportingObserver = new BOOMR.window.ReportingObserver(function(reports, observer) {
					if (BOOMR.utils.isArray(reports)) {
						for (i = 0; i < reports.length; i++) {
							report = reports[i];
							msg = report && report.body && (report.body.message || report.body.reason);
							if (msg) {
								impl.send({
									message: msg,
									fileName: report.body.sourceFile || report.url,
									lineNumber: report.body.lineNumber,
									columnNumber: report.body.columnNumber,
									noStack: true
								}, E.VIA_REPORTING_API);
							}
						}
					}
				}, {buffered: true});

				impl.reportingObserver.observe();
			}


			return this;
		},

		/**
		 * This plugin is always complete (ready to send a beacon)
		 *
		 * @returns {boolean} `true`
		 * @memberof BOOMR.plugins.Errors
		 */
		is_complete: function() {
			return true;
		},

		/**
		 * Determines if Error tracking is initialized.
		 *
		 * @returns {boolean} `true`
		 * @memberof BOOMR.plugins.Errors
		 */
		is_supported: function() {
			return impl.initialized;
		},

		//
		// Public Exports
		//
		// constants
		/**
		 * This error came from the app
		 */
		SOURCE_APP: 1,

		/**
		 * This error came from Boomerang
		 */
		SOURCE_BOOMERANG: 2,

		//
		// Via: Where the error came from
		//
		/**
		 * This error was generated by {@link BOOMR.plugins.Errors.wrap},
		 * {@link BOOMR.plugins.Errors.test} or {@link BOOMR.plugins.Errors.send}
		 */
		VIA_APP: 1,

		/**
		 * This error was caught by the Global Exception handler (e.g.
		 * `window.onerror`).
		 */
		VIA_GLOBAL_EXCEPTION_HANDLER: 2,

		/**
		 * This was a network error caught by XMLHttpRequest instrumentation.
		 */
		VIA_NETWORK: 3,

		/**
		 * This was caught by `console.error()`
		 */
		VIA_CONSOLE: 4,

		/**
		 * This was caught by monitoring `addEventListener()`
		 */
		VIA_EVENTHANDLER: 5,

		/**
		 * This was caught by monitoring `setTimeout()` or `setInterval()`
		 */
		VIA_TIMEOUT: 6,

		/**
		 * This was caught by monitoring unhandled promise rejection events
		 */
		VIA_REJECTION: 7,

		/**
		 * Observed with the Reporting API
		 */
		VIA_REPORTING_API: 8,

		//
		// Events
		//
		/**
		 * A click event
		 */
		EVENT_CLICK: 1,

		/**
		 * A network event
		 */
		EVENT_NETWORK: 2,

		/**
		 * A console.log event
		 */
		EVENT_LOG: 3,

		// functions
		send: impl.send,
		wrap: impl.wrap,
		test: impl.test,

		// objects
		BoomerangError: BoomerangError

		//
		// Test Exports (only for debug)
		//
	};

}());


/**
 * Plugin to implement the method queue pattern for Boomerang:
 *
 * {@link http://www.lognormal.com/blog/2012/12/12/the-script-loader-pattern/#the_method_queue_pattern}
 *
 * For information on how to include this plugin, see the {@tutorial building} tutorial.
 *
 * ## Beacon Parameters
 *
 * This plugin adds no parameters to the beacon.
 *
 * ## Usage
 *
 * The `BOOMR_mq` plugin can be used to call {@link BOOMR} methods before boomerang.js
 * has fully loaded on the page.
 *
 * If Boomerang is already on the page when `BOOMR_mq.push()` is used, the
 * specified function will be called immediatley.
 *
 * Otherwise, the specified function will be called as soon as Boomerang has
 * loaded.
 *
 * ## Example
 *
 * `BOOMR_mq` is a global array that lives on the `window` object.  If it doesn't
 * exist, you should create it.
 *
 * To queue {@link BOOMR} methods, simply `push()` arrays onto the object.
 *
 * The first parameter in the array is the {@link BOOMR} method name.
 *
 * The rest of the parameters will be passed to that method.
 *
 * @example
 * window.BOOMR_mq = window.BOOMR_mq || [];
 *
 * // add two variables to the beacon once Boomerang has loaded
 * window.BOOMR_mq.push(
 *   ["addVar", "var1", "value1"],
 *   ["addVar", "var2", "value2"]
 * );
 *
 * @class BOOMR_mq
 */
(function() {


	/**
	 * Process a single `BOOMR_mq` entry.
	 *
	 * @param {string[]} args Entry arguments
	 * @param {function} callback Callback function
	 * @param {object} thisArg The 'this'
	 */
	function processEntry(args, callback, thisArg) {
		var methodName = args.shift();
		if (typeof methodName !== "string") {
			return;
		}

		var split = methodName.split("."), method = BOOMR, _this = BOOMR;
		if (split[0] === "BOOMR") {
			// the BOOMR namespace is inferred, remove it if it was specified
			split.shift();
		}

		// loop through all of `split`, stepping into only objects and functions
		while (split.length &&
			method && // `null` is an object, skip it
			(typeof method === "object" || typeof method === "function")) {
			var word = split.shift();
			method = method[word];
			if (split.length) {
				_this = _this[word]; // the `this` is everything up until the method name
			}
		}

		// if we've used all of `split`, and have resolved to a function, call it
		if (!split.length && typeof method === "function") {
			var returnValue = method.apply(_this, args);

			// pass the return value of the resolved function as the only argument to the
			// optional `callback`
			if (typeof callback === "function") {
				callback.call(thisArg, returnValue);
			}
		}
	}

	/**
	 * Processes a list of `BOOMR_mq` entries
	 *
	 * @param {string[][]} entries Entries
	 */
	function processEntries(entries) {
		for (var i = 0; i < entries.length; i++) {
			var params = entries[i];
			if (!params) {
				continue;
			}

			if (BOOMR.utils.isArray(params)) {
				processEntry(params);
			}
			else if (typeof params === "object" && BOOMR.utils.isArray(params.arguments)) {
				processEntry(params.arguments, params.callback, params.thisArg);
			}
		}
	}

	// process the window's current queue'd entries
	var mq = BOOMR.window.BOOMR_mq;
	if (BOOMR.utils.isArray(mq)) {
		processEntries(mq);
	}

	// replace the queue with an immediate processor now that we're loaded
	BOOMR.window.BOOMR_mq = {
		push: function() {
			processEntries(arguments);
		}
	};
})();

(function() {

    // A private object to encapsulate all your implementation details
    // This is optional, but the way we recommend you do it.
    impl = {

    };

    //
    // Public exports
    //
    BOOMR.plugins.convertTuna = {
        init: function(config) {
            // list of user configurable properties
            var properties = ["prop1", "prop2"];

            // This block is only needed if you actually have user configurable properties
            BOOMR.utils.pluginConfig(impl, config, "convertTuna", properties);

            // Other initialization code here

            // Subscribe to any BOOMR events here.
            // Unless your code will explicitly be called by the developer
            // or by another plugin, you must to do this.

            return this;
		},

		setting: {
			pageId: -1,
			lut: [],
			hashList: [],
			table : [0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
				0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988, 0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
				0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
				0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
				0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172, 0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
				0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
				0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
				0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924, 0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
				0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
				0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
				0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e, 0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
				0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
				0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
				0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0, 0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
				0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
				0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
				0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a, 0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
				0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
				0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
				0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc, 0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
				0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
				0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
				0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236, 0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
				0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
				0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
				0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38, 0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
				0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
				0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
				0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2, 0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
				0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
				0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
				0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94, 0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d],
			// REQ_TYPES : {
			// 	/** Unknown type */
			// 	"other": 0,
			// 	/** IMG element (or IMAGE element inside a SVG for IE, Edge and Firefox) */
			// 	"img": 1,
			// 	/** LINK element (i.e. CSS) */
			// 	"link": 2,
			// 	/** SCRIPT element */
			// 	"script": 3,
			// 	/** Resource referenced in CSS */
			// 	"css": 4,
			// 	/** XMLHttpRequest */
			// 	"xmlhttprequest": 5,
			// 	/** The root HTML page itself */
			// 	"html": 6,
			// 	/** IMAGE element inside a SVG */
			// 	"image": 7,
			// 	/** [sendBeacon]/
			// 	"beacon": 8,
			// 	/** [Fetch API] */
			// 	"fetch": 9,
			// 	/** An IFRAME */
			// 	"iframe": "10",
			// 	/** IE11 and Edge (some versions) send "subdocument" instead of "iframe" */
			// 	"subdocument": "10",
			// 	/** page itself */
			// 	"document": "11",
			// 	"error": "12"
			// },
			getReqType: function(type){
				//var t = 'document';
				var t = '11'; // document
				switch(type){
					case 'error':
						t = '12'
						break;
					case 'xhr':
						t = '5'
						break;
				}
				return t;
			},
			INT_MAX: 2147483647
		},

		is_complete: function(){
			var lut = [];
			for (var i = 0; i < 256; i++) { lut[i] = (i < 16 ? '0' : '') + (i).toString(16); }
			this.setting.lut = lut;
			return true;
		},

		getHash: function(strValue) {
			if(strValue == undefined || strValue == "") return 0;
			var bytesValue = strValue.split('').map(function (s) { return s.charCodeAt(0); });
			var crc = -1;
			for (var i = 0; i < bytesValue.length; i++) {
				var b = bytesValue[i];
				crc = (crc >>> 8) ^ this.setting.table[(crc ^ b) & 0xff];
			}
			crc = crc ^ -1;
			return crc;
		},
		getParamValue: function(getParamKey) {
			var query  = window.location.search.substring(1);
			if (!query) {
				var hash = window.location.hash;
				query = hash.slice(hash.indexOf('?') + 1);
			}
			var queryData = {};
			query.split('&').forEach(function(d){
				var str = d.split('=');
				queryData[str[0]] = str[1];
			})
			return  getParamKey in queryData ? '[' + queryData[getParamKey] + ']' : '';
		},

		
		validVal: function(a, b) {
			if (a < 0 || a > this.setting.INT_MAX || isNaN(a)) {
				a = b
			}
			return a;
		},

		getCookie: function(name) {
			var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
			return value? value[2] : "";
		},

	
		convert: function(d, error) {

			// console.log( JSON.stringify(BOOMR.plugins.xhrWatcher.xhrDataStorage) );
			
			var ntPage = d['http.initiator'] == 'spa_hard';

			if(!BOOMR.initSended && ('nt_nav_st' in d)){
				BOOMR.initSended = d;
			}

			if(ntPage && !('nt_nav_st' in d)){
				d.nt_res_end = BOOMR.initSended.nt_res_end;
				d.nt_res_st = BOOMR.initSended.nt_res_st;
				d.nt_domcomp = BOOMR.initSended.nt_domcomp;
				d.nt_domint = BOOMR.initSended.nt_domint;
				d.nt_load_end = BOOMR.initSended.nt_load_end;
				d.nt_res_st = BOOMR.initSended.nt_res_st;
				d.nt_con_end = BOOMR.initSended.nt_con_end;
				d.nt_con_st = BOOMR.initSended.nt_con_st;
				d.nt_ssl_st = BOOMR.initSended.nt_ssl_st;
				d.nt_nav_st = BOOMR.initSended.nt_nav_st;
			}

			try {	
				var useSeriveQueryString = false;
				// var serviceQueryKey = "param1";
				var invalidValue = -1;
                var o = BOOMR.window.location.origin;
                if(d.u.indexOf(o) !== -1) {
                    d.u = d.u.replace(o,"");
                }
				var serviceKey = this.getParamValue(BOOMR.tunaServiceKey);
				var tempServiceName ="";
				if(useSeriveQueryString) {
					tempServiceName = d.u + serviceKey;
				}  else {
					tempServiceName = d.u;
				}

				var serviceName = "";
				var serviceHash = this.getHash(tempServiceName);
				// if (!contains(this.setting.hashList, serviceHash)) {
				if (this.setting.hashList.indexOf(serviceHash)<0) {
					this.setting.hashList.push(serviceHash);
					serviceName = tempServiceName;
				}

				var pgurl = "";
				var pgurlHash = undefined;
				if(d.pgu != undefined) {
					pgurlHash = this.getHash(d.pgu)
					if (this.setting.hashList.indexOf(pgurlHash)<0) {
						this.setting.hashList.push(pgurlHash);
						pgurl = d.pgu
					}
				}

				var reqType = this.setting.getReqType(d['http.initiator']);
				var convertedData = {
					"T1": d.t_done,
					"T2": d.t_resp,
					"T3": ntPage ? this.validVal(d.nt_res_end - d.nt_res_st, invalidValue): invalidValue,
					"T4": ntPage ? this.validVal(d.nt_domcomp - d.nt_domloading, invalidValue): d.t_page,
					"T6": ntPage ? this.validVal(d.nt_domcomp - d.nt_nav_st, invalidValue): invalidValue,
					"T7": ntPage ? this.validVal(d.nt_domint - d.nt_nav_st, invalidValue): invalidValue,
					"T8": ntPage ? this.validVal(d.nt_load_end - d.nt_load_st, invalidValue): invalidValue,
					"T9": ntPage ? this.validVal(d.nt_res_st - d.nt_nav_st, invalidValue): d.t_resp,
					"T10": ntPage ? this.validVal(d.nt_con_end - d.nt_con_st, invalidValue): invalidValue,
					"T11": ntPage ? this.validVal(d.nt_con_end - d.nt_ssl_st, invalidValue): invalidValue,
					"T12": ntPage ? this.validVal(d.nt_dns_end - d.nt_dns_st, invalidValue): invalidValue,
					"T13": ntPage ? this.validVal(d.nt_con_end - d.nt_nav_st, invalidValue): invalidValue,				
					"P": pgurl, // The URL of the page the resource was fetched on
					"L": serviceName,
					"H": serviceHash,
					"I" : pgurlHash,
					"D": BOOMR.now(),
					"T": reqType,	
					"Z": d.xhrData.join(','),
					"U" : BOOMR.utils.generateUUID(),
					"Y": (reqType == '11') ? d.restiming : ''
					//"originData" : JSON.stringify( d )
				};

				// xhr error
				// console.log( d.err );
				var isXhrErr = (d['http.initiator'] == 'xhr' && 'http.errno' in d && d['http.errno'] != 200 ) || (d['http.initiator'] == 'xhr' && ('err' in d));
                if( (isXhrErr || d['http.initiator'] == 'error') || ('err' in d && d.err.length)){ // xhr error || window.onerror
                    var errData = (isXhrErr || d.err.length==1) ? d.err[0] : d.err[1];
					if(errData != undefined && errData.f != undefined) {
						var lastErrData = errData.f[0];
						var firstErrData  = (errData.f.length > 0) ? errData.f[errData.f.length -1] : errData.f[0];
						
						// var xhrErrData = errData.f.slice(-1)[0];
						var errorMsg="";
						
						var errorMsgHash = this.getHash(errData.m);
						if (this.setting.hashList.indexOf(errorMsgHash)<0) {
							this.setting.hashList.push(errorMsgHash);
							errorMsg = errData.m;
						} 
		
						// var hasError = ('t' in errData);
						convertedData["V"] = lastErrData.l;
						convertedData["F"] = (lastErrData.w || lastErrData.wo);
						convertedData["R"] = this.getHash(lastErrData.w) || this.getHash(lastErrData.wo);
						if(reqType == 11 || reqType == 12) { // document
							convertedData["A"] =  firstErrData.l;
							convertedData["B"] = (firstErrData.w || firstErrData.wo);
							convertedData["C"] = this.getHash(firstErrData.w) || this.getHash(firstErrData.wo);
						} else if (reqType == 5) { // xhr
							convertedData["A"] =  0;
							convertedData["B"] = d.pgu;
							convertedData["C"] = this.getHash(d.pgu);
						}
						convertedData["M"] = errorMsg;
						convertedData["Q"] = errorMsgHash;
					}
				}

				return convertedData;

			} catch (error) {
				console.log(error);
			}
			//return d;

		}
	};

}());

(function(){
	BOOMR.plugins.xhrWatcher = {
		xhrData: [],
		xhrDataStorage: [],
		hasInited: false,
		init: function(){
			return this;
		},
		is_complete: function(){
			return true;
		},
		pushHeader: function(x){
			// console.log(x);
			// this.xhrData.push( x.getResponseHeader("connection") );
			if(x === 'spa_hard_done' || x === 'spa_done'){
				// spa_hard
				this.xhrDataStorage.push( BOOMR.plugins.convertTuna.getCookie("X-Scouter-Gxid") );
				BOOMR.addVar('xhrData', this.xhrDataStorage);
			}else{
				// xhr
				// console.log('axhr x.getResponseHeader("X-Scouter-Gxid")');
				// console.log(x);
				var checkHost;
				var hasHost;
				if (x.resource.url.indexOf('://') > 0) {
					hasHost = true;
				} else {
					hasHost = false;
				}
				var tunaGxid = "";
				if (x.resource.url.indexOf('://') < 1) {
					checkHost = location.protocol + '//' + location.host; //this._url.split('://')[0];
				} else {
					checkHost = x.resource.url;
				}

				// // for IE
				// if(!('responseURL' in this)){
				//     var origin = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
				//     var suffix = location.href.split(origin)[1];
				//     checkHost += suffix;
				// }

				if (checkHost.indexOf(location.host) > 0 || !hasHost) {	
					tunaGxid = x.getResponseHeader("X-Scouter-Gxid") || "";
				}
				this.xhrDataStorage.push( tunaGxid );
				this.xhrData = [tunaGxid];

				BOOMR.addVar('xhrData', this.xhrData);
			}

			

		}
	}
}());

/* BOOMR init */
BOOMR.init({
	// beacon_url: "http://example.com/api/boomerang/",
	tunaServiceKey: 'temp111',
	beacon_url: "/tuna_.gif",
	instrument_xhr: true,
	History: {
		enable: true,
		auto: true
	},
	Errors: {
  	sendAfterOnload: true,
	onError: function(err) {
	  // if( err.code ) BOOMR.plugins.xhrWatcher.xhrDataStorage = [];
      // BOOMR.plugins.convertTuna.sendError(err);
			// if (err.message && err.message.indexOf("internally handled")) {
			// 	return false;
			// }
			return true;
		},
    onxhrerror: function(err){
			// console.log(err);
    }

	}
}).subscribe('beacon', function(e){ // beacon 보낸 이후 초기화
  BOOMR.plugins.xhrWatcher.xhrData = [];
  if(e["T"] == '11'){ // spa_hard, spa_soft
	  BOOMR.plugins.xhrWatcher.xhrDataStorage = [];
  }
}).subscribe('xhr_error', function(err){
  // BOOMR.plugins.convertTuna.sendError(err);
}).subscribe('xhr_load', function(e){
  // console.log(e);
  // BOOMR.plugins.convertTuna.sendError(err);
}).subscribe('spa_navigation', function(e){
	console.log(e);
}).subscribe('spa_init', function(e){
	BOOMR.plugins.xhrWatcher.xhrDataStorage = [];
})

// setTimeout(function(){
// 	aaa();
// }, 5000)
