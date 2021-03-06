{add_block group='toolbar' name='toolbar_comment.tpl'
  aPagingCmt=$aPagingCmt
  iTargetId=$iTargetId
  sTargetType=$sTargetType
  iMaxIdComment=$iMaxIdComment
}

{hook run='comment_tree_begin' iTargetId=$iTargetId sTargetType=$sTargetType}

<div class="comments-tree">
  <div class="comments" id="comments">

    <header class="comments-header">
      <h3><span id="count-comments">{$iCountComment}</span> {$iCountComment|declension:$aLang.comment_declension:'russian'}</h3>

      {if $bAllowSubscribe and $oUserCurrent}
        <div class="hidden-xs text-muted subscribe">
          <div class="checkbox">
            <label>
              <input {if $oSubscribeComment and $oSubscribeComment->getStatus()}checked="checked"{/if} type="checkbox" id="comment_subscribe" class="input-checkbox" onchange="ls.subscribe.toggle('{$sTargetType}_new_comment','{$iTargetId}','',this.checked);">
              {$aLang.comment_subscribe}
            </label>
          </div>
        </div>
      {/if}
    </header>


    {assign var="nesting" value="-1"}
    {foreach from=$aComments item=oComment name=rublist}
      {assign var="cmtlevel" value=$oComment->getLevel()}

      {if $cmtlevel>$oConfig->GetValue('module.comment.max_tree')}
        {assign var="cmtlevel" value=$oConfig->GetValue('module.comment.max_tree')}
      {/if}

      {if $nesting < $cmtlevel}
      {elseif $nesting > $cmtlevel}
        {section name=closelist1  loop=$nesting-$cmtlevel+1}</div>{/section}
      {elseif not $smarty.foreach.rublist.first}
        </div>
      {/if}

      <div class="comment-wrapper" id="comment_wrapper_id_{$oComment->getId()}">

      {include file='comment.tpl'}
      {assign var="nesting" value=$cmtlevel}
      {if $smarty.foreach.rublist.last}
        {section name=closelist2 loop=$nesting+1}</div>{/section}
      {/if}
    {/foreach}
  </div>


  {include file='comment_paging.tpl' aPagingCmt=$aPagingCmt}

  {hook run='comment_tree_end' iTargetId=$iTargetId sTargetType=$sTargetType}

  {if $bAllowNewComment}
    {$sNoticeNotAllow}
  {else}
    {if $oUserCurrent}
      {include file='editor.tpl' sImgToLoad='form_comment_text' sSettingsTinymce='ls.settings.getTinymceComment()' sSettingsMarkitup='ls.settings.getMarkitupComment()'}

      <h3 class="reply-header" id="comment_id_0">
        <a href="#" class="link-dotted" onclick="ls.comments.toggleCommentForm(0); return false;">{$sNoticeCommentAdd}</a>
      </h3>

      <div id="reply" class="reply">
        <form method="post" id="form_comment" onsubmit="return false;" enctype="multipart/form-data">
          {hook run='form_add_comment_begin'}

          <textarea name="comment_text" id="form_comment_text" class="mce-editor markitup-editor form-control"></textarea>

          {hook run='form_add_comment_end'}

          <button type="submit" name="submit_comment"
              id="comment-button-submit"
              onclick="ls.comments.add('form_comment',{$iTargetId},'{$sTargetType}'); return false;"
              class="btn btn-success">{$aLang.comment_add}</button>
          <button type="button" onclick="ls.comments.preview();" class="btn btn-default">{$aLang.comment_preview}</button>

          <input type="hidden" name="reply" value="0" id="form_comment_reply" />
          <input type="hidden" name="cmt_target_id" value="{$iTargetId}" />
        </form>
      </div>
    {else}
      <div class="alert alert-info" role="alert">{$aLang.comment_unregistered}</div>
    {/if}
  {/if}
</div>
