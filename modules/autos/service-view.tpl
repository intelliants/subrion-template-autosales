<div class="v-item">
	<div class="v-item__header">
		<ul class="content__actions">
			{if !empty($author)}
				<li class="text-fade-50 small"><a href="{ia_url type='url' item='members' data=$author}"><span class="fa fa-user"></span> {lang key='by'} {$author.fullname|default:$author.username}</a></li>
			{/if}
			{foreach $core.actions as $name => $action}
				<li>
					{if 'action-favorites' == $name}
						{printFavorites item=$item itemtype=$item.item}
					{else}
						<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
							<span class="fa fa-{$name}" title="{$action.title}"></span>
						</a>
					{/if}
				</li>
			{/foreach}
		</ul>
		<h2>
			{if $item.logo}
				{ia_image file=$item.logo title=$item.title class='img-circle' width=30}
			{/if}
			<span>{$item.title}</span>
		</h2>
	</div>
</div>

<div class="row">
	<div class="col-md-4">
		<table class="v-item-table">
			<tbody>
				<tr>
					<td>{lang key='field_autos_services_categories'}</td>
					<td>
						{$services = explode(',', $item.categories)}

						{foreach $services as $service}
							{lang key="field_autos_services_categories+{$service}"}{if !$service@last}, {/if}
						{/foreach}
					</td>
				</tr>
				<tr>
					<td>{lang key='field_autos_services_company_address'}</td>
					<td>{$item.company_address}</td>
				</tr>
				<tr>
					<td>{lang key='field_autos_services_company_phone'}</td>
					<td>{$item.company_phone}</td>
				</tr>
				{if !empty($item.company_website)}
					<tr>
						<td>{lang key='field_autos_services_company_website'}</td>
						<td>{$item.company_website|linkify}</td>
					</tr>
				{/if}
				{if !empty($item.company_skype)}
					<tr>
						<td>{lang key='field_autos_services_company_skype'}</td>
						<td><a href="call:{$item.company_skype}">{$item.company_skype}</a></td>
					</tr>
				{/if}
			</tbody>
		</table>

		<div class="v-item-info">
			<div id="gm-map" class="m-t" style="height: 300px;width: 100%;"></div>
			<script type="text/javascript">
function initMap() {
  var map = new google.maps.Map(document.getElementById('gm-map'), {
    zoom: 14,
    center: { lat: -34.397, lng: 150.644 }
  });
  var geocoder = new google.maps.Geocoder();

  geocodeAddress(geocoder, map);
}

function geocodeAddress(geocoder, resultsMap) {
  var address = '{$item.company_address}';
  geocoder.geocode({ 'address': address }, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
			</script>
			<script async defer src="//maps.googleapis.com/maps/api/js?callback=initMap"></script>
		</div>
	</div>

	<div class="col-md-8">
		{if !empty($item.pictures)}
			{ia_add_media files='fotorama'}

			<div class="ia-item-view__gallery">
				<div class="fotorama"
					 data-nav="thumbs"
					 data-width="100%"
					 data-ratio="800/400"
					 data-allowfullscreen="true"
					 data-fit="{$core.config.template_fotorama_service}">
					{foreach $item.pictures as $entry}
						<a class="v-item__gallery__item" href="{ia_image file=$entry type='large' url=true}">{ia_image file=$entry title=$entry.title}</a>
					{/foreach}
				</div>
			</div>
		{/if}

		{if !empty($item.description)}
			<div class="v-item-info">
				<div class="v-item-info__section">
					<h3>{lang key='details'}</h3>
					{$item.description|escape:'html'}
				</div>
			</div>
		{/if}

		<div class="m-t-lg">
			{ia_hooker name='smartyItemViewBeforeTabs'}

			{include file='item-view-tabs.tpl' isView=true exceptions=['logo', 'pictures', 'title', 'categories', 'description', 'company_address', 'company_phone', 'company_website', 'company_skype'] class='ia-item-view-tabs'}

			{ia_hooker name='smartyViewListingBeforeFooter'}
		</div>
	</div>
</div>
