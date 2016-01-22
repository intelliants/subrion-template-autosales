<div class="v-item">
	<div class="v-item__header">
		<ul class="content__actions">
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
			<span>{$item.title}</span>
		</h2>
	</div>
</div>

<div class="row">
	<div class="col-md-4">
		<table class="v-item-table">
			<tbody>
				<tr>
					<td>{lang key='field_price'}</td>
					<td><b class="text-success">{$core.config.currency}{$item.price}</b></td>
				</tr>
				<tr>
					<td>{lang key='field_categories'}</td>
					<td>
						{$cats = explode(',', $item.categories)}

						{foreach $cats as $cat}
							{lang key="field_autos_parts_categories_{$cat}"}{if !$cat@last}, {/if}
						{/foreach}
					</td>
				</tr>
			</tbody>
		</table>

		<table class="v-item-table m-t">
			<tbody>
				<tr>
					<td>{lang key='field_company_title'}</td>
					<td>{$item.company_title}</td>
				</tr>
				{if $item.company_address}
					<tr>
						<td>{lang key='field_company_address'}</td>
						<td>{$item.company_address}</td>
					</tr>
				{/if}
				<tr>
					<td>{lang key='field_company_phone'}</td>
					<td>{$item.company_phone}</td>
				</tr>
				{if $item.company_website}
					<tr>
						<td>{lang key='field_company_website'}</td>
						<td>{$item.company_website|linkify}</td>
					</tr>
				{/if}
				{if $item.company_skype}
					<tr>
						<td>{lang key='field_company_skype'}</td>
						<td><a href="call:{$item.company_skype}">{$item.company_skype}</a></td>
					</tr>
				{/if}
			</tbody>
		</table>

		{if $item.company_details}
			<div class="v-item-info m-t">
				<p><b>{lang key='field_company_details'}</b></p>
				{$item.company_details}
			</div>
		{/if}
	</div>

	<div class="col-md-8">
		{if !empty($item.pictures)}
			{ia_add_media files='fotorama'}
			{$pics=unserialize($item.pictures)}

			<div class="v-item__gallery">
				<div class="fotorama" 
					 data-nav="thumbs"
					 data-width="100%"
					 data-ratio="800/400"
					 data-allowfullscreen="true"
					 data-fit="{$core.config.template_fotorama_part}">
					{foreach $pics as $entry}
						<a class="v-item__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
					{/foreach}
				</div>
			</div>
		{/if}

		<div class="v-item-info">
			<div class="v-item-info__section">
				<h3>{lang key='details'}</h3>
				{$item.description|escape:'html'}
			</div>
		</div>

		<div class="m-t-lg">
			{ia_hooker name='smartyItemViewBeforeTabs'}

			{include file='item-view-tabs.tpl' isView=true exceptions=['pictures', 'title', 'price', 'categories', 'description', 'company_title', 'company_address', 'company_phone', 'company_website', 'company_skype', 'company_details'] class='ia-item-view-tabs'}

			{ia_hooker name='smartyViewListingBeforeFooter'}
		</div>
	</div>
</div>