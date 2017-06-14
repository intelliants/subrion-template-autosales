{if !empty($newsline)}
    <div class="row">
        {foreach $newsline as $entry}
            {assign var='num_columns' value=((isset($core.config.newsline_row_count)) ? $core.config.newsline_row_count : 3)}
            {assign class_names ['col-md-12', 'col-md-6', 'col-md-4', 'col-md-3']}

            <div class="{$class_names[$num_columns - 1]}">
                <div class="ia-items latest-news">
                    <div class="media ia-item ia-item--border-bottom">
                        <div class="media-body">
                            {if $entry.image && $core.config.newsline_display_img}
                                <a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}" class="pull-right">{ia_image file=$entry.image title=$entry.title width=100}</a>
                            {/if}
                            <h4 class="media-heading">
                                <a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">{$entry.title|escape}</a>
                            </h4>
                            <p class="text-fade-50">{$entry.date|date_format:$core.config.date_format} {lang key='by'} {$entry.fullname|escape}</p>
                            <p>{$entry.body|strip_tags|truncate:$core.config.newsline_body_max:'...'} <a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}.html">{lang key='continue_reading'}</a></p>
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
{/if}