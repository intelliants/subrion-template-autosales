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
		<div class="v-item__header__price">{$core.config.currency} {$item.price}</div>
		<div class="v-item__header__info">
			{if isset($item.part_number) && $item.part_number}
				<span class="v-item__header__info__item pull-right">#{$item.part_number}</span>
			{/if}
			{if $item.sponsored}<span class="v-item__header__info__item label label-warning">{lang key='sponsored'}</span>{/if}
			{if $item.featured}<span class="v-item__header__info__item label label-info">{lang key='featured'}</span>{/if}
			<span class="v-item__header__info__item">
				{$cats = explode(',', $item.categories)}

				{foreach $cats as $cat}
					{lang key="field_autos_parts_categories_{$cat}"}{if !$cat@last}, {/if}
				{/foreach}
			</span>
			<span class="v-item__header__info__item">{lang key='added_on'} {$item.date_added|date_format:$core.config.date_format}</b></span>
		</div>
	</div>
</div>

{if !empty($item.pictures)}
	{ia_add_media files='fotorama'}

	<div class="v-item__gallery">
		<div class="fotorama" 
			 data-nav="thumbs"
			 data-width="100%"
			 data-ratio="800/400"
			 data-allowfullscreen="true"
			 data-fit="{$core.config.template_fotorama_part}">
			{foreach $item.pictures as $entry}
				<a class="v-item__gallery__item" href="{ia_image file=$entry type='large' url=true}">{ia_image file=$entry}</a>
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

	{include file='item-view-tabs.tpl' isView=true exceptions=['pictures', 'title', 'price', 'categories', 'description', 'part_number'] class='ia-item-view-tabs'}

	{ia_hooker name='smartyViewListingBeforeFooter'}
</div>