<div class="ia-item">
    <div class="ia-item__image">
        {ia_image file=$listing.avatar type='large' title=$listing.fullname|default:$listing.username gravatar=true email=$listing.email gravatar_width=200}
    </div>
    <div class="ia-item__content">
        <div class="ia-item__actions">
            {printFavorites item=$listing itemtype='members' guests=true tpl='no-text'}
            {accountActions item=$listing itemtype='members'}
            <a href="{$listing.link}">{lang key='view_profile'} <span class="fa fa-angle-double-right"></span></a>
        </div>

        <h4 class="ia-item__title">
            <a href="{$listing.link}">{$listing.fullname|default:$listing.username}</a>
        </h4>

        <div class="ia-item__additional">
            {if !empty($listing.phone)}
                <p><span class="fa fa-phone"></span> {$listing.phone|escape}</p>
            {/if}
            {if !empty($listing.website)}
                <p><span class="fa fa-globe"></span> <a href="{$listing.website|escape}" target="_blank">{lang key='field_members_website'}</a></p>
            {/if}
            {if !empty($listing.facebook)}
                <p><span class="fa fa-facebook"></span> <a href="{$listing.facebook|escape}" target="_blank">{lang key='field_members_facebook'}</a></p>
            {/if}
            {if !empty($listing.twitter)}
                <p><span class="fa fa-twitter"></span> <a href="{$listing.twitter|escape}" target="_blank">{lang key='field_members_twitter'}</a></p>
            {/if}
            {if !empty($listing.gplus)}
                <p><span class="fa fa-google-plus"></span> <a href="{$listing.gplus|escape}" target="_blank">{lang key='field_members_gplus'}</a></p>
            {/if}
            {if !empty($listing.linkedin)}
                <p><span class="fa fa-linkedin"></span> <a href="{$listing.linkedin|escape}" target="_blank">{lang key='field_members_linkedin'}</a></p>
            {/if}
        </div>

        {if !empty($listing.biography)}
            <p>{$listing.biography|escape|truncate:250:'...':true}</p>
        {/if}

        {foreach $fields as $field}
            {if !in_array($field.name, array('username', 'avatar', 'fullname', 'phone', 'website', 'facebook', 'twitter', 'gplus', 'linkedin', 'biography')) && 'plan_id' != $field.name}
                {include file='field-type-content-view.tpl' wrappedValues=true item=$listing}
            {/if}
        {/foreach}
    </div>
</div>