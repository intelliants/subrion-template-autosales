<form method="get" class="form-inline ia-cards__filter">
	{lang key='filter'}:
	<div class="ia-cards__filter__item">
		<select class="form-control" name="status">
			<option value="">&lt;{lang key='status'}&gt;</option>
			{foreach $statuses as $status}
				<option value="{$status}"{if isset($smarty.get.status) && $status == $smarty.get.status} selected="selected"{/if}>{lang key=$status}</option>
			{/foreach}
		</select>
	</div>
	<div class="ia-cards__filter__item">
		<input type="hidden" name="model"{if !empty($smarty.get.model)} value="{$smarty.get.model|intval}"{/if}>
		<select class="form-control js-filters-form" data-children="{$parents}">
			<option value="">&lt;{lang key='model'}&gt;</option>
			{foreach $makes as $make}
				<option value="{$make.id}">{$make.title}</option>
			{/foreach}
		</select>
	</div>
	
	<button type="submit" class="btn btn-primary">{lang key='filter'}</button>
</form>

{ia_add_media files='js:jquery/plugins/jquery.ia-dropdown.min'}
{ia_add_js}
$(function()
{
	$('.js-filters-form').iaDropdown(
	{
		url: intelli.config.ia_url + 'profile/autos.json',
		valueHolder: 'model'
	});
});
{/ia_add_js}