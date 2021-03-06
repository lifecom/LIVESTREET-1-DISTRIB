{foreach from=$aReplyWall item=oReplyWall}
  {assign var="oReplyUser" value=$oReplyWall->getUser()}
  <div id="wall-reply-item-{$oReplyWall->getId()}" class="js-wall-reply-item comment wall-comment-reply">
    <a href="{$oReplyUser->getUserWebPath()}"><img src="{$oReplyUser->getProfileAvatarPath(48)}" alt="{$oReplyUser->getLogin()}" class="comment-avatar" /></a>

    <ul class="list-unstyled list-inline small comment-info">
      <li class="comment-author"><a href="{$oReplyUser->getUserWebPath()}">{$oReplyUser->getLogin()}</a></li>
      <!-- online-offline status -->
      <li class="{if $oReplyUser->isOnline()}text-success{else}text-danger{/if} comment-author-status">
        <i title="{if $oReplyUser->isOnline()}{$aLang.user_status_online}{else}{$aLang.user_status_offline}{/if}" class="fa fa-power-off"></i>
      </li>
      <!-- / online-offline status -->
      <li class="text-muted comment-date"><time datetime="{date_format date=$oReplyWall->getDateAdd() format='c'}">{date_format date=$oReplyWall->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</time></li>
    </ul>

    <div class="comment-content text">
      {$oReplyWall->getText()}
    </div>

    {if $oReplyWall->isAllowDelete()}
      <ul class="list-unstyled list-inline small comment-actions">
        <li><a href="#" onclick="return ls.wall.remove({$oReplyWall->getId()});" class="link-dotted comment-delete">{$aLang.wall_action_delete}</a></li>
      </ul>
    {/if}
  </div>
{/foreach}
