<div class="ia-item ia-item--border ia-item--card ia-item--{$listing.status} {if $listing.featured}ia-item--featured{/if} {if $listing.sponsored}ia-item--sponsored{/if}">
	{if $listing.pictures}
		{$pics=unserialize($listing.pictures)}
		<a class="ia-item__image" href="{ia_url item='autos_parts' data=$listing type='url'}">
			{printImage imgfile=$pics[0]['path'] title="{$listing.title}" class='img-responsive'}
		</a>
	{/if}

	<div class="ia-item__labels">
		{if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
		{if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}

		{if $member && $member.id == $listing.member_id && 'active' != $listing.status}
			<span class="label label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status default=$listing.status}</span>
		{/if}
	</div>

	<div class="ia-item__content">
		<div class="ia-item__actions">
			{printFavorites item=$listing itemtype='autos_parts' guests=true tpl='no-text'}
			{accountActions item=$listing itemtype='autos_parts'}
		</div>

		<div class="ia-item__title">
			{ia_url item='autos_parts' type='link' data=$listing text="{$listing.title}"}
		</div>

		<div class="ia-item__additional">
			<p class="text-success">{$core.config.currency} {$listing.price}</p>
			{if isset($listing.company_phone) && $listing.company_phone}
				<p><span class="fa fa-phone"></span> {$listing.company_phone}</p>
			{/if}
		</div>

		<p>{$listing.description|escape|truncate:150:'...':true}</p>

		<a class="btn btn-success btn-block" href="{ia_url item='autos_parts' data=$listing type='url'}">{lang key='view'}</a>
	</div>
</div>