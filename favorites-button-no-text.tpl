<a href="#" class="js-favorites {$replace.class}"
	data-item="{$replace.item}"
	data-id="{$replace.id}"
	data-action="{$replace.action}"
	data-guests="{$replace.guests}"
	data-text-add="<span class='fa fa-star-o'></span>"
	data-text-delete="<span class='fa fa-star'></span>"
	rel="nofollow" data-toggle="tooltip" title="{lang key=$replace.text}">
	{if 'add' == $replace.action}<span class='fa fa-star-o'></span>{else}<span class='fa fa-star'></span>{/if}</a>