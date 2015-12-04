{*if isset($car_blocks_data.random)}
	<h2 class="title title--accent">{$block.title|escape:'html'}</h2>
	<div class="owl-carousel ia-carousel js-carousel-random">
		{foreach $car_blocks_data.random as $item}
			<div class="ia-carousel__item">
				<div class="ia-card ia-card--small -{$item.status} {if 'hidden' == $item.status}-hidden{/if} {if $item.featured}-featured{/if} {if $item.sponsored}-sponsored{/if}">
					{if $item.auto_pictures}
						<a class="ia-card__image" href="{$item.link}">
							{printImage imgfile=$item.auto_pictures[0]['path'] title=$item.model}
							<span class="ia-card__support-info">
								<span class="pull-left"><span class="fa fa-image"></span> {$item.auto_pictures_num}</span>
								<span class="pull-right">{$item.date_added|date_format:$core.config.date_format}</span>
							</span>
						</a>
					{/if}

					<div class="ia-card__content">
						<div class="ia-card__actions dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
							<ul class="dropdown-menu pull-right no-drop">
								<li>{printFavorites item=$item itemtype='autos' guests=true}</li>
								<li><a href="{$item.link}"><span class="fa fa-automobile"></span> {lang key='car_details'}</a></li>
								<li>{accountActions item=$item itemtype='autos'}</li>
							</ul>
						</div>
						<a class="ia-card__title" href="{$item.link}">{$item.model}, {$item.release_year}</a>
						<p class="ia-card__sub-title">{$item.price}</p>
					</div>
				</div>
			</div>
		{/foreach}
	</div>

	{ia_add_js}
$(function() {
	$('.js-carousel-random').owlCarousel({
		items: 6,
		margin: 10,
		dots: false,
		nav: true,
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
	{/ia_add_js}
{/if*}