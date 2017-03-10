{if isset($car_blocks_data.recent)}
	<div class="recent-cars">
		{foreach $car_blocks_data.recent as $item}
			<div class="ia-card ia-card--hsm -{$item.status}">

				{if $item.pictures}
					<a class="ia-card__image" href="{$item.link}">{ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}</a>
				{else}
					<a class="ia-card__image" href="{$item.link}"><img class="img-responsive" src="{$img}no-car-preview.png" alt="{$item.model}"></a>
				{/if}

				<div class="ia-card__content">
					<a class="ia-card__title" href="{$item.link}">{$item.model}, {$item.release_year}</a>
					<p class="ia-card__sub-title">{$item.price_formatted}</p>
					{if $item.mileage}
						<p class="ia-card__text">
							<span class="fa fa-tachometer"></span> <b>{$item.mileage}</b>
						</p>
					{/if}
					<p>
						{if $item.engine}
							{lang key="field_autos_engine+{$item.engine}"}{if $item.engine_type} {lang key="field_autos_engine_type+{$item.engine_type}"}{/if}{if $item.engine_size} {$item.engine_size}{/if},
						{/if}
						{if $item.transmission}
							{lang key="field_autos_transmission+{$item.transmission}"}
						{/if}
						{if $item.exterior_color && isset($item.exterior_color)}, {lang key="field_autos_exterior_color+{$item.exterior_color}"}{/if}
					</p>
				</div>
			</div>
		{/foreach}
	</div>
{/if}