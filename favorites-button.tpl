<a href="#" class="js-favorites {$replace.class}"
	data-item="{$replace.item}"
	data-id="{$replace.id}"
	data-action="{$replace.action}"
	data-guests="{$replace.guests}"
	data-text-add="<span class='fa fa-star-o'></span> {lang key='add_to_wishlist'}"
	data-text-delete="<span class='fa fa-star'></span> {lang key='remove_from_wishlist'}"
	rel="nofollow" data-toggle="tooltip" title="{lang key=$replace.text}">
	{if 'add' == $replace.action}<span class='fa fa-star-o'></span> {lang key='add_to_wishlist'}{else}<span class='fa fa-star'></span> {lang key='remove_from_wishlist'}{/if}</a>