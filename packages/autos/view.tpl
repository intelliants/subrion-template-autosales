<div class="v-item">
	<div class="row">
		<div class="col-md-6">
			{if !empty($item.auto_pictures)}
				{ia_add_media files='js: _IA_TPL_fotorama'}

				<div class="v-item__gallery">
					<div class="fotorama" 
						 data-nav="thumbs"
						 data-width="100%"
						 data-ratio="800/400"
						 data-allowfullscreen="true"
						 data-fit="{$core.config.template_fotorama_car}">
						{foreach $item.auto_pictures as $entry}
							<a class="v-item__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
						{/foreach}
					</div>
				</div>
			{/if}
		</div>
		<div class="col-md-6">
			<div class="v-item__header">
				<ul class="content__actions">
					{if $member && $member.id == $item.member_id}
						<li>
							<span class="label label-{$item.status}" title="{lang key=$item.status default=$item.status}"><span class="fa fa-warning"></span> {lang key=$item.status default=$item.status}</span>
						</li>
					{/if}
					{foreach $core.actions as $name => $action}
						<li>
							{if 'action-favorites' == $name}
								{printFavorites item=$item itemtype=$item.item guests=true tpl='no-text'}
							{else}
								<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
									<span class="fa fa-{$name}" title="{$action.title}"></span>
								</a>
							{/if}
						</li>
					{/foreach}
				</ul>

				<h2><span>{$item.model}, {$item.release_year}</span></h2>
				<div class="v-item__header__price">{$item.price}</div>
				<div class="v-item-header__info">
					{if $item.sponsored}<span class="v-item__header__info__item label label-warning">{lang key='sponsored'}</span>{/if}
					{if $item.featured}<span class="v-item__header__info__item label label-info">{lang key='featured'}</span>{/if}
					<span class="v-item__header__info__item">{lang key='field_condition'}: <a href="{$searchPageUrl}condition:{$item.condition}/"><b>{lang key="field_condition_{$item.condition}"}</b></a></span>
					<span class="v-item__header__info__item"><span class="fa fa-eye"></span> {$item.views_num}</span>
					<span class="v-item__header__info__item">{lang key='added_on'} {$item.date_added|date_format:$core.config.date_format}</b></span>
				</div>
				<div class="ia-car-info ia-car-info--block">
					<span class="ia-car-info__icon ia-car-info__icon--body">{lang key='field_body_type'}: <a href="{$smarty.const.IA_URL}search/cars/body:{$item.body_type}/"><b>{lang key="field_body_type_{$item.body_type}"}</b></a></span>
					{if $item.engine}
						<span class="ia-car-info__icon ia-car-info__icon--engine">{lang key='field_engine'}: <b>{lang key="field_engine_{$item.engine}"}{if $item.engine_type} {lang key="field_engine_type_{$item.engine_type}"}{/if}{if $item.engine_size} {$item.engine_size}{/if}</b></span>
					{/if}
					{if $item.transmission}
						<span class="ia-car-info__icon ia-car-info__icon--transmission">{lang key='field_transmission'}: <a href="{$smarty.const.IA_URL}search/cars/transmission:{$item.transmission}/"><b>{lang key="field_transmission_{$item.transmission}"}</b></a></span>
					{/if}
					{if $item.mileage}
						<span class="ia-car-info__icon ia-car-info__icon--mileage">{lang key='field_mileage'}: <b>{$item.mileage}</b></span>
					{/if}
				</div>
				<div class="v-item__header__social">
					<a href="https://www.facebook.com/sharer/sharer.php?u={$smarty.const.IA_SELF|escape:'url'}&t={$item.model}, {$item.release_year}" title="Share on Facebook" target="_blank" class="btn btn-sm btn-facebook"><i class="fa fa-facebook"></i></a></li>
					<a href="https://twitter.com/intent/tweet?source={$smarty.const.IA_SELF|escape:'url'}&text={$item.model}, {$item.release_year}:{$smarty.const.IA_SELF|escape:'url'}" title="Share on Twitter" target="_blank" class="btn btn-sm btn-twitter"><i class="fa fa-twitter"></i></a></li>
					<a href="https://plus.google.com/share?url={$smarty.const.IA_SELF|escape:'url'}" title="Share on Google+" target="_blank" class="btn btn-sm btn-googleplus"><i class="fa fa-google-plus"></i></a></li>
					<a href="mailto:?subject={$item.model},{$item.release_year}&body={$item.model}, {$item.release_year}:{$smarty.const.IA_SELF|escape:'url'}" target="_blank" title="Email" class="btn btn-sm btn-email"><i class="fa fa-envelope"></i></a></li>
				</div>
			</div>
		</div>
	</div>

	<div class="v-item-info">
		<div class="v-item-info__section">
			<h3>{lang key='details'}</h3>
			<div class="row">
				<div class="col-md-6">
					<table class="v-item-table">
						<tbody>
							{if $item.door_count}
								<tr>
									<td>{lang key='field_door_count'}</td>
									<td>{lang key="field_door_count_{$item.door_count}"}</td>
								</tr>
							{/if}
							{if $item.exterior_color}
								<tr>
									<td>{lang key='field_exterior_color'}</td>
									<td><a href="{$smarty.const.IA_URL}search/cars/exterior_color:{$item.exterior_color}/">{lang key="field_exterior_color_{$item.exterior_color}"}</a></td>
								</tr>
							{/if}
							{if $item.metallic}
								<tr>
									<td>{lang key='field_metallic'}</td>
									<td>{lang key="field_metallic_{$item.metallic}"}</td>
								</tr>
							{/if}
							{if $item.interior_color}
								<tr>
									<td>{lang key='field_interior_color'}</td>
									<td>{lang key="field_interior_color_{$item.interior_color}"}</td>
								</tr>
							{/if}
							{if $item.interior_leather}
								<tr>
									<td>{lang key='field_interior_leather'}</td>
									<td>{lang key="field_interior_leather_{$item.interior_leather}"}</td>
								</tr>
							{/if}
						</tbody>
					</table>
				</div>
				<div class="col-md-6">
					<table class="v-item-table">
						<tbody>
							{if $item.horse_power}
								<tr>
									<td>{lang key='field_horse_power'}</td>
									<td>{$item.horse_power}</td>
								</tr>
							{/if}
							
							{if $item.drive_type}
								<tr>
									<td>{lang key='field_drive_type'}</td>
									<td><a href="{$smarty.const.IA_URL}search/cars/drive_type:{$item.drive_type}/">{lang key="field_drive_type_{$item.drive_type}"}</a></td>
								</tr>
							{/if}
							{if $item.vin_code}
								<tr>
									<td>{lang key='field_vin_code'}</td>
									<td>{$item.vin_code|escape:'html'}</td>
								</tr>
							{/if}
							{if $item.fuel_type}
								<tr>
									<td>{lang key='field_fuel_type'}</td>
									<td>
										{assign fuel explode(',', $item.fuel_type)}
										{foreach $fuel as $one}
											{lang key="field_fuel_type_{$one}"}{if !$one@last}, {/if}
										{/foreach}
									</td>
								</tr>
							{/if}
						</tbody>
					</table>
				</div>
			</div>
		</div>

		{if $item.options_features}
			<div class="v-item-info__section">
				<h3>{lang key='car_features'}</h3>
				<div class="v-item-features">
					{$features = array()}
					{foreach $sections as $section_name => $section}
						{foreach $section as $sec}
							{foreach $sec.fields as $field}
								{if $field.name == 'options_features'}
									{$features = $field.values}
								{/if}
							{/foreach}
						{/foreach}
					{/foreach}

					{$itemFeatures = explode(',', $item.options_features)}

					{foreach array_keys($features) as $opt}
						<div class="v-item-features__item {if in_array($opt, $itemFeatures)} active{/if}"><span class="fa fa-check-square"></span> {lang key="field_options_features_{$opt}"}</div>
					{/foreach}
				</div>
			</div>
		{/if}
		
		{if $item.additional_info}
			<div class="v-item-info__section">
				<h3>{lang key='field_additional_info'}</h3>
				{$item.additional_info}
			</div>
		{/if}

		{ia_hooker name='smartyItemViewBeforeTabs'}

		{include file='item-view-tabs.tpl' isView=true exceptions=array('model', 'price', 'release_year', 'condition', 'mileage', 'engine', 'engine_type', 'engine_size', 'horse_power', 'transmission', 'auto_pictures', 'fuel_type', 'body_type', 'exterior_color', 'door_count', 'metallic', 'interior_color', 'interior_leather', 'drive_type', 'vin_code', 'additional_info', 'options_features') class='v-item-info__section'}

		{ia_hooker name='smartyViewListingBeforeFooter'}
	</div>
</div>