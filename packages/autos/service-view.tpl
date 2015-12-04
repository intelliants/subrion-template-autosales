<div class="v-item -{$item.status}" id="service-{$item.id}">
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
						{printFavorites item=$item itemtype=$item.item}
					{else}
						<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
							<span class="fa fa-{$name}" title="{$action.title}"></span>
						</a>
					{/if}
				</li>
			{/foreach}
		</ul>
		<h2><span>{$item.title}</span></h2>
	</div>

	<div class="row">
		<div class="col-md-6">
			{if !empty($item.pictures)}
				{ia_add_media files='fotorama'}
				{$pics=unserialize($item.pictures)}

				<div class="ia-item-view__gallery">
					<div class="fotorama" 
						 data-nav="thumbs"
						 data-width="100%"
						 data-ratio="800/400"
						 data-allowfullscreen="true"
						 data-fit="cover">
						{foreach $pics as $entry}
							<a class="ia-item-view__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
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
		</div>
		<div class="col-md-6">
			<table class="v-item-table">
				<tbody>
					<tr>
						<td>{lang key='field_company_title'}</td>
						<td>{$item.company_title}</td>
					</tr>
					<tr>
						<td>{lang key='field_company_address'}</td>
						<td>{$item.company_address}</td>
					</tr>
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
					{if $item.company_details}
						<tr>
							<td colspan="2" class="-clear">
								<p><b>{lang key='field_company_details'}</b></p>
								<p>{$item.company_details|escape:'html'}</p>
							</td>
						</tr>
					{/if}
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="m-t-lg">
	{ia_hooker name='smartyItemViewBeforeTabs'}

	{include file='item-view-tabs.tpl' isView=true exceptions=['pictures', 'title', 'categories', 'description', 'company_title', 'company_address', 'company_phone', 'company_website', 'company_skype', 'company_details'] class='ia-item-view-tabs'}

	{ia_hooker name='smartyViewListingBeforeFooter'}
</div>