{if isset($car_blocks_data.sponsored)}
	<div class="container">
		<h2 class="title title--accent">{lang key='special_offers'}</h2>
		<div class="owl-carousel ia-carousel js-carousel-sponsored">
			{foreach $car_blocks_data.sponsored as $item}
				<div class="ia-carousel__item">
					<div class="ia-card -{$item.status} {if 'hidden' == $item.status}-hidden{/if}">

						{if !empty($item.pictures)}
							<a class="ia-card__image" href="{$item.link}">
								{ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}

								<span class="ia-card__badge">{lang key="field_autos_condition+{$item.condition}"}</span>

								<span class="ia-card__support-info">
									<span class="pull-left"><span class="fa fa-image"></span> {$item.pictures_num}</span>
									<span class="pull-right">{$item.date_added|date_format:$core.config.date_format}</span>
								</span>
							</a>
						{else}
							<a class="ia-card__image" href="{$item.link}">
								<img class="img-responsive" src="{$img}no-car-preview.png" alt="{$item.model}">
							</a>
						{/if}

						<div class="ia-card__content">
							<div class="ia-card__actions dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-h"></span></a>
								<ul class="dropdown-menu pull-right no-drop">
									<li>{printFavorites item=$item itemtype='autos' guests=true}</li>
									<li><a href="{$item.link}"><span class="fa fa-automobile"></span> {lang key='car_details'}</a></li>
									<li>{accountActions item=$item itemtype='autos'}</li>
								</ul>
							</div>
							<a class="ia-card__title" href="{$item.link}">{$item.model}, {$item.release_year}</a>
							<p class="ia-card__sub-title">{$item.price_formatted}</p>
							{if $item.mileage}
								<p class="ia-card__text">
									<span class="fa fa-tachometer"></span> <b>{$item.mileage}</b>
								</p>
							{/if}
							<p class="ia-card__text">
								{if $item.engine}
									{lang key="field_autos_engine+{$item.engine}"}{if $item.engine_type} {lang key="field_autos_engine_type+{$item.engine_type}"}{/if}{if $item.engine_size} {$item.engine_size}{/if},
								{/if}
								{if $item.transmission}
									{lang key="field_autos_transmission+{$item.transmission}"},
								{/if}
								{lang key="field_autos_exterior_color+{$item.exterior_color}"}
							</p>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
	</div>

	{ia_add_js}
$(function() {
	$('.js-carousel-sponsored').owlCarousel({
		items: 5,
		margin: 30,
		dots: false,
		nav: true,
		loop: false,
		autoplay:true,
		autoplayTimeout:2000,
		autoplayHoverPause:true,
		navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
		responsive: {
			0: {
				items: 1
			},
			320: {
				items: 1
			},
			500: {
				items: 3
			},
			768: {
				items: 4
			},
			1200: {
				items: 5
			}
		}
	});
});
	{/ia_add_js}
{/if}
