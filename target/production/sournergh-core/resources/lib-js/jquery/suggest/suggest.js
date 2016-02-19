
/*
 * Copyright (c) 2006 Brandon Aaron (http://brandonaaron.net) Dual licensed
 * under the MIT (http://www.opensource.org/licenses/mit-license.php) and GPL
 * (http://www.opensource.org/licenses/gpl-license.php) licenses.
 * 
 * $LastChangedDate: 2007-07-21 18:45:56 -0500 (Sat, 21 Jul 2007) $ $Rev: 2447 $
 * 
 * Version 2.1.1
 */
(function($) {
	$.fn.bgIframe = $.fn.bgiframe = function(s) {
		if ($.browser.msie && /6.0/.test(navigator.userAgent)) {
			s = $.extend({
						top : 'auto',
						left : 'auto',
						width : 'auto',
						height : 'auto',
						opacity : true,
						src : 'javascript:false;'
					}, s || {});
			var prop = function(n) {
				return n && n.constructor == Number ? n + 'px' : n;
			}, html = '<iframe class="bgiframe"frameborder="0"tabindex="-1"src="'
					+ s.src
					+ '"'
					+ 'style="display:block;position:absolute;z-index:-1;'
					+ (s.opacity !== false
							? 'filter:Alpha(Opacity=\'0\');'
							: '')
					+ 'top:'
					+ (s.top == 'auto'
							? 'expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)||0)*-1)+\'px\')'
							: prop(s.top))
					+ ';'
					+ 'left:'
					+ (s.left == 'auto'
							? 'expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth)||0)*-1)+\'px\')'
							: prop(s.left))
					+ ';'
					+ 'width:'
					+ (s.width == 'auto'
							? 'expression(this.parentNode.offsetWidth+\'px\')'
							: prop(s.width))
					+ ';'
					+ 'height:'
					+ (s.height == 'auto'
							? 'expression(this.parentNode.offsetHeight+\'px\')'
							: prop(s.height)) + ';' + '"/>';
			return this.each(function() {
						if ($('> iframe.bgiframe', this).length == 0)
							this.insertBefore(document.createElement(html),
									this.firstChild);
					});
		}
		return this;
	};
})(jQuery);

/*
 * Copyright (c) 2007 Paul Bakaus (paul.bakaus@googlemail.com) and Brandon Aaron
 * (brandon.aaron@gmail.com || http://brandonaaron.net) Dual licensed under the
 * MIT (http://www.opensource.org/licenses/mit-license.php) and GPL
 * (http://www.opensource.org/licenses/gpl-license.php) licenses.
 * 
 * $LastChangedDate: 2007-12-20 08:43:48 -0600 (Thu, 20 Dec 2007) $ $Rev: 4257 $
 * 
 * Version: 1.2
 * 
 * Requires: jQuery 1.2+
 */
(function($) {
	$.dimensions = {
		version : '1.2'
	};
	$.each(['Height', 'Width'], function(i, name) {
		$.fn['inner' + name] = function() {
			if (!this[0])
				return;
			var torl = name == 'Height' ? 'Top' : 'Left', borr = name == 'Height'
					? 'Bottom'
					: 'Right';
			return this.is(':visible') ? this[0]['client' + name] : num(this,
					name.toLowerCase())
					+ num(this, 'padding' + torl) + num(this, 'padding' + borr);
		};
		$.fn['outer' + name] = function(options) {
			if (!this[0])
				return;
			var torl = name == 'Height' ? 'Top' : 'Left', borr = name == 'Height'
					? 'Bottom'
					: 'Right';
			options = $.extend({
						margin : false
					}, options || {});
			var val = this.is(':visible') ? this[0]['offset' + name] : num(
					this, name.toLowerCase())
					+ num(this, 'border' + torl + 'Width')
					+ num(this, 'border' + borr + 'Width')
					+ num(this, 'padding' + torl) + num(this, 'padding' + borr);
			return val
					+ (options.margin ? (num(this, 'margin' + torl) + num(this,
							'margin' + borr)) : 0);
		};
	});
	$.each(['Left', 'Top'], function(i, name) {
				$.fn['scroll' + name] = function(val) {
					if (!this[0])
						return;
					return val != undefined ? this.each(function() {
								this == window || this == document
										? window
												.scrollTo(
														name == 'Left'
																? val
																: $(window)['scrollLeft'](),
														name == 'Top'
																? val
																: $(window)['scrollTop']())
										: this['scroll' + name] = val;
							})
							: this[0] == window || this[0] == document
									? self[(name == 'Left'
											? 'pageXOffset'
											: 'pageYOffset')]
											|| $.boxModel
											&& document.documentElement['scroll'
													+ name]
											|| document.body['scroll' + name]
									: this[0]['scroll' + name];
				};
			});
	$.fn.extend({
		position : function() {
			var left = 0, top = 0, elem = this[0], offset, parentOffset, offsetParent, results;
			if (elem) {
				offsetParent = this.offsetParent();
				offset = this.offset();
				parentOffset = offsetParent.offset();
				offset.top -= num(elem, 'marginTop');
				offset.left -= num(elem, 'marginLeft');
				parentOffset.top += num(offsetParent, 'borderTopWidth');
				parentOffset.left += num(offsetParent, 'borderLeftWidth');
				results = {
					top : offset.top - parentOffset.top,
					left : offset.left - parentOffset.left
				};
			}
			return results;
		},
		offsetParent : function() {
			var offsetParent = this[0].offsetParent;
			while (offsetParent
					&& (!/^body|html$/i.test(offsetParent.tagName) && $.css(
							offsetParent, 'position') == 'static'))
				offsetParent = offsetParent.offsetParent;
			return $(offsetParent);
		}
	});
	function num(el, prop) {
		return parseInt($.curCSS(el.jquery ? el[0] : el, prop, true)) || 0;
	};
})(jQuery);

/*
 * jquery.suggest 1.1 - 2007-08-06
 * 
 * Uses code and techniques from following libraries: 1.
 * http://www.dyve.net/jquery/?autocomplete 2.
 * http://dev.jquery.com/browser/trunk/plugins/interface/iautocompleter.js
 * 
 * All the new stuff written by Peter Vulgaris (www.vulgarisoip.com) Feel free
 * to do whatever you want with this file
 * 
 */

(function($) {

	$.suggest = function(input, options) {
		var $input = $(input).attr("autocomplete", "off");
		var $results = $(document.createElement("ul"));

		var timeout = false; // hold timeout ID for suggestion results to
								// appear
		var prevLength = 0; // last recorded length of $input.val()
		var cache = []; // cache MRU list
		var cacheSize = 0; // size of cache in chars (bytes?)

		$results.addClass(options.resultsClass).appendTo('body');

		resetPosition();
		$(window).load(resetPosition) // just in case user is changing size of
										// page while loading
				.resize(resetPosition);

		$input.blur(function() {
					setTimeout(function() {
								$results.hide()
							}, 200);
				});

		// help IE users if possible
		try {
			$results.bgiframe();
		} catch (e) {
		}

		// I really hate browser detection, but I don't see any other way
		if ($.browser.mozilla)
			$input.keypress(processKey); // onkeypress repeats arrow keys in
											// Mozilla/Opera
		else
			$input.keydown(processKey); // onkeydown repeats arrow keys in
										// IE/Safari

		function resetPosition() {
			// requires jquery.dimension plugin
			var offset = $input.offset();
			$results.css({
						top : (offset.top + input.offsetHeight) + 'px',
						left : offset.left + 'px'
					});
		}

		function processKey(e) {

			// handling up/down/escape requires results to be visible
			// handling enter/tab requires that AND a result to be selected
			if ((/27$|38$|40$/.test(e.keyCode) && $results.is(':visible'))
					|| (/^13$|^9$/.test(e.keyCode) && getCurrentResult())) {

				if (e.preventDefault)
					e.preventDefault();
				if (e.stopPropagation)
					e.stopPropagation();

				e.cancelBubble = true;
				e.returnValue = false;

				switch (e.keyCode) {

					case 38 : // up
						prevResult();
						break;

					case 40 : // down
						nextResult();
						break;

					case 9 : // tab
					case 13 : // return
						selectCurrentResult();
						break;

					case 27 : // escape
						$results.hide();
						break;

				}

			} else if ($input.val().length != prevLength) {

				if (timeout)
					clearTimeout(timeout);
				timeout = setTimeout(suggest, options.delay);
				prevLength = $input.val().length;

			}

		}

		function suggest() {

			var q = $.trim($input.val());

			if (q.length >= options.minchars) {

				cached = checkCache(q);

				if (cached) {

					displayItems(cached['items']);

				} else {

					/*
					 * 2008-04-10 Thomas Weber: changed to general AJAX call
					 * with JSON communications, due to issues with IE6 and IE7
					 * :-/
					 */
					$.ajax({
								url : options.source,
								type : 'GET',
								dataType : 'json',
								timeout : 2000,
								data : {
									q : q
								},
								error : function(req, msg) {
									return;
								},
								success : function(json) {
									$results.hide();
									displayItems(json);
									addToCache(q, json, json.length);
								}
							});

				}

			} else {

				$results.hide();

			}

		}

		function checkCache(q) {

			for (var i = 0; i < cache.length; i++)
				if (cache[i]['q'] == q) {
					cache.unshift(cache.splice(i, 1)[0]);
					return cache[0];
				}

			return false;

		}

		function addToCache(q, items, size) {

			while (cache.length && (cacheSize + size > options.maxCacheSize)) {
				var cached = cache.pop();
				cacheSize -= cached['size'];
			}

			cache.push({
						q : q,
						size : size,
						items : items
					});

			cacheSize += size;

		}

		function displayItems(items) {

			if (!items)
				return;

			if (!items.length) {
				$results.hide();
				return;
			}

			var html = '';
			for (var i = 0; i < items.length; i++)
				html += '<li>' + items[i] + '</li>';

			$results.html(html).show();

			$results.children('li').mouseover(function() {
						$results.children('li')
								.removeClass(options.selectClass);
						$(this).addClass(options.selectClass);
					}).click(function(e) {
						e.preventDefault();
						e.stopPropagation();
						selectCurrentResult();
					});

		}

		function parseTxt(txt, q) {

			var items = [];
			var tokens = txt.split(options.delimiter);

			// parse returned data for non-empty items
			for (var i = 0; i < tokens.length; i++) {
				var token = $.trim(tokens[i]);
				if (token) {
					token = token.replace(new RegExp(q, 'ig'), function(q) {
								return '<span class="' + options.matchClass
										+ '">' + q + '</span>'
							});
					items[items.length] = token;
				}
			}

			return items;
		}

		function getCurrentResult() {

			if (!$results.is(':visible'))
				return false;

			var $currentResult = $results.children('li.' + options.selectClass);

			if (!$currentResult.length)
				$currentResult = false;

			return $currentResult;

		}

		function selectCurrentResult() {

			$currentResult = getCurrentResult();

			if ($currentResult) {
				$input.val($currentResult.text());
				$results.hide();

				if (options.onSelect)
					options.onSelect.apply($input[0]);

			}

		}

		function nextResult() {

			$currentResult = getCurrentResult();

			if ($currentResult)
				$currentResult.removeClass(options.selectClass).next()
						.addClass(options.selectClass);
			else
				$results.children('li:first-child')
						.addClass(options.selectClass);

		}

		function prevResult() {

			$currentResult = getCurrentResult();

			if ($currentResult)
				$currentResult.removeClass(options.selectClass).prev()
						.addClass(options.selectClass);
			else
				$results.children('li:last-child')
						.addClass(options.selectClass);

		}

	}

	$.fn.suggest = function(source, options) {

		if (!source)
			return;

		options = options || {};
		options.source = source;
		options.delay = options.delay || 100;
		options.resultsClass = options.resultsClass || 'ac_results';
		options.selectClass = options.selectClass || 'ac_over';
		options.matchClass = options.matchClass || 'ac_match';
		options.minchars = options.minchars || 2;
		options.delimiter = options.delimiter || '\n';
		options.onSelect = options.onSelect || false;
		options.maxCacheSize = options.maxCacheSize || 65536;

		this.each(function() {
					new $.suggest(this, options);
				});

		return this;

	};

})(jQuery);
