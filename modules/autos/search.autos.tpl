{if isset($listings) && $listings}
    <div class="ia-cards">
        <div class="ia-cards__items{if isset($smarty.cookies.cardsLayout)} -{$smarty.cookies.cardsLayout}{/if}">
            <div class="row">
                {foreach $listings as $listing}
                    <div class="col-md-3">
                        {include file='extra:autos/list-autos'}
                    </div>

                    {if $listing@iteration % 4 == 0 && !$listing@last}
                        </div>
                        <div class="row">
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
{else}
    <div class="alert alert-info">{lang key='no_listings_to_show'}</div>
{/if}