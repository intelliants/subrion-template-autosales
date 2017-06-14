{if isset($category)}
    <div class="page-description">{$category.description}</div>
{/if}

{if !empty($models)}
    {ia_block title={lang key='autos_models'} style='fixed' id='auto_categories'}
        <div class="ia-categories">
            {include file='ia-categories.tpl' categories=$models item='autos_models' show_amount=true num_columns=$core.config.autos_model_columns}
        </div>
    {/ia_block}
{/if}

{if !empty($listings)}
    <div class="ia-cards">
        <div class="ia-cards__actions">
            {if 'autos_index_member' == $core.page.name}
                {include file='extra:autos/listing-filters'}
            {/if}
            {if !isset($no_sorting)}
                <div class="ia-cards__sorting{if 'autos_index_member' == $core.page.name} pull-right m-l{/if}">
                    {lang key='sort_by'}:
                    <div class="btn-group">
                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                            {if 'release_year' != $sorting.field}
                                {lang key=$sorting.field}
                            {else}
                                {lang key='field_autos_release_year'}
                            {/if}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="{$smarty.const.IA_SELF}?sort=title" rel="nofollow"><span class="fa fa-font"></span> {lang key='title'}</a></li>
                            <li><a href="{$smarty.const.IA_SELF}?sort=price" rel="nofollow"><span class="fa fa-dollar"></span> {lang key='price'}</a></li>
                            <li><a href="{$smarty.const.IA_SELF}?sort=year" rel="nofollow"><span class="fa fa-calendar"></span> {lang key='field_autos_release_year'}</a></li>
                            <li><a href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow"><span class="fa fa-clock-o"></span> {lang key='date'}</a></li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                            {if $sorting.direction == 'ASC'}
                                {lang key='asc'}
                            {else}
                                {lang key='desc'}
                            {/if}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="{$smarty.const.IA_SELF}?order=asc" rel="nofollow"><span class="fa fa-long-arrow-down"></span> {lang key='asc'}</a></li>
                            <li><a href="{$smarty.const.IA_SELF}?order=desc" rel="nofollow"><span class="fa fa-long-arrow-up"></span> {lang key='desc'}</a></li>
                        </ul>
                    </div>
                </div>
            {/if}
            <div class="ia-cards__layout">
                <a class="btn btn-default js-toggle-layout{if isset($smarty.cookies.cardsLayout) && 'list' == $smarty.cookies.cardsLayout} active{/if}" data-layout="list" href="#"><span class="fa fa-bars"></span> {lang key='list'}</a>
                <a class="btn btn-default js-toggle-layout{if isset($smarty.cookies.cardsLayout) && 'grid' == $smarty.cookies.cardsLayout} active{/if}" data-layout="grid" href="#"><span class="fa fa-th"></span> {lang key='grid'}</a>
            </div>
        </div>
        <div class="ia-cards__items{if isset($smarty.cookies.cardsLayout)} -{$smarty.cookies.cardsLayout}{else} -list{/if}">
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

    {navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aIgnore=true}
{elseif isset($category.id) && $category.level}
    <div class="alert alert-info">
        {if 'autos_search' == $core.page.name}
            {lang key='nothing_found'}
        {else}
            {lang key='no_listings_to_show'}
        {/if}
    </div>
{elseif !isset($category.id)}
    <div class="alert alert-info">
        {lang key='no_listings_to_show'}
    </div>
{/if}
