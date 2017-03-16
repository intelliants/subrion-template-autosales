{if isset($car_blocks_data.random)}
	<div class="container">
		<h2 class="title title--accent">{$block.title|escape:'html'}</h2>
		<div class="owl-carousel ia-carousel js-carousel-random">
			{foreach $car_blocks_data.random as $item}
				<div class="ia-carousel__item">
					<div class="ia-card -{$item.status} {if 'hidden' == $item.status}-hidden{/if} {if $item.featured}-featured{/if} {if $item.sponsored}-sponsored{/if}">
						{if !empty($item.pictures)}
							<a class="ia-card__image" href="{$item.link}">
								{ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}
								<span class="ia-card__support-info">
									<span class="pull-left"><span class="fa fa-image"></span> {$item.pictures_num}</span>
									<span class="pull-right">{$item.date_added|date_format:$core.config.date_format}</span>
								</span>
							</a>
						{else}
							<img src="{$img}no-car-preview.png" alt="{$item.model}">
						{/if}

						<div class="ia-card__content">
							<div class="ia-card__actions dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
								<ul class="dropdown-menu pull-right no-drop">
									<li>{printFavorites item=$item itemtype='autos' guests=true}</li>
									<li>
										<a href="#" class="btn-compare{if ($item.compare)} btn-compare--added{/if}" data-id="{$item.id}">
											<span class="btn-compare__icon fa fa-balance-scale"></span>
											<span class="btn-compare__text">
												{if ($item.compare)}
													{lang key='remove_from_compare'}
												{else}
													{lang key='add_to_compare'}
												{/if}
											</span>
										</a>
										{ia_print_js files='_IA_URL_modules/autos/js/front/comparison'}
									</li>
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
{/if}