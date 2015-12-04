$(function() {

	// toggle tooltips
	$('[data-toggle="tooltip"]').tooltip({
		container: 'body'
	});

	//
	// Utils
	// --------------------------------------------------

	$('.modal').appendTo('body');


	//
	// Back to top
	// --------------------------------------------------

	$('.js-back-to-top').on('click', function(e) {
		e.preventDefault();

		$('html, body').animate({
			scrollTop: 0
		}, 'fast');
	})

	//
	// Custom checkbox
	// --------------------------------------------------

	var $customChecks = $('.c-checkbox');

	$customChecks.each(function() {
		var $this = $(this).find('input'),
			$parent = $this.parent(),
			$icon = $parent.find('.fa');

		if ($this.prop('checked')) {
			$icon.removeClass('fa-square').addClass('fa-check-square')
		} else {
			$icon.removeClass('fa-check-square').addClass('fa-square')
		}
	});

	$customChecks.on('change', 'input', function () {
		var $this = $(this),
			$parent = $this.parent(),
			$icon = $parent.find('.fa');

		if ($this.prop('checked')) {
			$icon.removeClass('fa-square').addClass('fa-check-square')
		} else {
			$icon.removeClass('fa-check-square').addClass('fa-square')
		}
	});



	//
	// Expand makes list
	// --------------------------------------------------

	if ($('.pr-list-simple').length) {
		$('.pr-list-simple .row:nth-child(5)').nextAll('.row')
			.wrapAll('<div class="pr-list-simple__hidden"></div>')

		$('.js-more-makes').on('click', function(e) {
			e.preventDefault();

			var $this = $(this),
				$hiddenList = $('.pr-list-simple__hidden'),
				lessText = $this.data('less-makes-text'),
				moreText = $this.data('more-makes-text');

			if (!$hiddenList.hasClass('is-visible')) {
				$hiddenList.slideDown('fast', function() {
					$hiddenList.addClass('is-visible');
					$this.html(lessText);
				});
			} else {
				$hiddenList.slideUp('fast', function() {
					$hiddenList.removeClass('is-visible');
					$this.html(moreText);
				});
			}
		});
	}



	//
	// Search toggle
	// --------------------------------------------------

	$('.js-q-search-toggle').click(function(e) {
		e.preventDefault();

		var $this = $(this);

		if (!$this.hasClass('active')) {

			$this.addClass('active');

			$('.q-search').slideDown('fast', function() {
				var $c = $('.js-carousel-makes');

				$c.trigger('destroy.owl.carousel');
				$c.html($c.find('.owl-stage-outer').html()).removeClass('owl-loaded');
				$c.owlCarousel({
					items: 4,
					margin: 0,
					dots: false,
					nav: true,
					loop: true,
					autoplay:true,
					autoplayTimeout:1000,
					autoplayHoverPause:true,
					navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
					responsive: {
						0: {
							items: 1
						},
						320: {
							items: 2
						},
						500: {
							items: 3
						},
						768: {
							items: 4
						}
					}
				});
			});
		} else {
			$this.removeClass('active');
			$('.q-search').slideUp('fast');
		}
	});



	//
	// Layout for cards
	// --------------------------------------------------

	$('.js-toggle-layout').on('click', function(e) {
		e.preventDefault();

		var $this = $(this),
			layout = $this.data('layout'),
			$cards = $('.ia-cards__items');

		$this.addClass('active').siblings().removeClass('active');
		$cards.removeClass('-list -grid').addClass('-' + layout);

		intelli.cookie.write('cardsLayout', layout, 30, intelli.config.baseurl.replace(window.location.origin, ''));
	});



	//
	// View page: move author and tools after car info
	// --------------------------------------------------

	var mq = function(query, callback, usePolyfill) {
	    var host = {};
	    var isMatchMediaSupported = !!(window && window.matchMedia) && !usePolyfill;
	    if(isMatchMediaSupported) {
	        var res = window.matchMedia(query);
	        callback.apply(host, [res.matches, res.media]);
	        res.addListener(function(changed) {
	            callback.apply(host, [changed.matches, changed.media]);
	        });
	    } else {
	        console.log('IE its you! Go home IE! You are drunk!');
	    }
	}

	if ($('.page-autos_view').length) {
		mq('(max-width: 768px)', function(match) {
		    if (match) {
		    	var $b = $('.content .aside');

		    	$b.insertAfter($b.next());
		    }
		});
	}
});