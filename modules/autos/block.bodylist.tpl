{if isset($car_blocks_data.body)}
	<div class="body-list">
		<div class="row">
			{foreach $car_blocks_data.body as $name => $entry}
				<div class="col-md-4">
					<a href="{$entry.url}" class="body-list__style body-list__style--{$name}">
						<span></span> {$entry.title|escape:'html'}
					</a>
				</div>

				{if $entry@iteration % 3 == 0 && !$entry@last}
					</div>
					<div class="row">
				{/if}
			{/foreach}
		</div>
	</div>
{/if}