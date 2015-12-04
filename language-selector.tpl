{if $core.config.language_switch && count($core.languages) > 1}
	<ul class="inv__nav inv__nav--langs">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				{$core.languages[$smarty.const.IA_LANGUAGE].title}
				<span class="fa fa-angle-down"></span>
			</a>
			<ul class="dropdown-menu pull-right">
				{foreach $core.languages as $code => $language}
					<li{if $smarty.const.IA_LANGUAGE == $code} class="active"{/if}><a href="{ia_page_url code=$code}" title="{$language.title}">{$language.title}</a></li>
				{/foreach}
			</ul>
		</li>
	</ul>
{/if}