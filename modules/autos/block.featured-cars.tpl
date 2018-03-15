{if isset($car_blocks_data.featured)}
    <div class="ia-items featured-cars">
        <div class="row">
            {foreach $car_blocks_data.featured as $item}
            <div class="col-md-4">
                <div class="ia-card -{$item.status} {if 'hidden' == $item.status}-hidden{/if}">

                    {if !empty($item.pictures)}
                        <a class="ia-card__image" href="{$item.link}">
                            {ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}

                            <span class="ia-card__badge">{lang key="field_auto_condition+{$item.condition}"}</span>

                            <span class="ia-card__support-info">
                                    <span class="pull-left"><span class="fa fa-image"></span> {$item.pictures_num}</span>
                                    <span class="pull-right">{$item.date_added|date_format:$core.config.date_format}</span>
                                </span>
                        </a>
                    {else}
                        <a class="ia-card__image" href="{$item.link}">
                            <img class="img-responsive" src="{$img}no-car-preview.png" alt="{$item.model}">
                        </a>
                    {/if}

                    <div class="ia-card__content">
                        <div class="ia-card__actions dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-h"></span></a>
                            <ul class="dropdown-menu pull-right no-drop">
                                <li>{printFavorites item=$item itemtype='autos' guests=true}</li>
                                <li>
                                    <a href="#" class="btn-compare{if ($item.compare)} btn-compare--added{/if}" data-id="{$item.id}">
                                        <span class="btn-compare__icon fa fa-balance-scale"></span>
                                        <span class="btn-compare__text">
                                                {if ($item.compare)}
                                                    {lang key='remove_from_compare'}
                                                {else}
                                                    {lang key='add_to_compare'}
                                                {/if}
                                            </span>
                                    </a>
                                    {ia_print_js files='_IA_URL_modules/autos/js/front/comparison'}
                                </li>
                                <li><a href="{$item.link}"><span class="fa fa-automobile"></span> {lang key='car_details'}</a></li>
                                <li>{accountActions item=$item itemtype='autos'}</li>
                            </ul>
                        </div>
                        <a class="ia-card__title" href="{$item.link}">{$item.model}, {$item.release_year}</a>
                        <p class="ia-card__sub-title">{$item.price_formatted}</p>
                        {if !empty($item.mileage)}
                            <p class="ia-card__text">
                                <span class="fa fa-tachometer"></span> <b>{$item.mileage}</b>
                            </p>
                        {/if}
                        <p class="ia-card__text">
                            {if !empty($item.engine)}
                                {lang key="field_auto_engine+{$item.engine}"}{if !empty($item.engine_type)} {lang key="field_auto_engine_type+{$item.engine_type}"}{/if}{if !empty($item.engine_size)} {$item.engine_size}{/if},
                            {/if}
                            {if !empty($item.transmission)}
                                {lang key="field_auto_transmission+{$item.transmission}"}
                            {/if}
                            {if !empty($item.exterior_color)}, {lang key="field_auto_exterior_color+{$item.exterior_color}"}{/if}
                        </p>
                    </div>
                </div>
            </div>

            {if $item@iteration % 3 == 0 && !$item@last}
        </div>
        <div class="row">
            {/if}
            {/foreach}
        </div>
    </div>
{/if}