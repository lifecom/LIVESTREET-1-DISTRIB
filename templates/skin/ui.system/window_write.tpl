<div class="modal fade in modal-write" id="modal_write">
  <div class="modal-dialog">
    <div class="modal-content">

      <header class="modal-header">
        <button type="button" class="close jqmClose" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">{$aLang.block_create}</h4>
      </header>

      {strip}
      <div class="modal-body">
        <ul class="list-unstyled list-inline write-list">
          <li class="write-item-type-topic">
            <a href="{router page='topic'}add" class="write-item-image"><i class="fa fa-file-text fa-fw fa-5x"></i></a>
            <a href="{router page='topic'}add" class="write-item-link">{$aLang.block_create_topic_topic}</a>
          </li>
          <li class="write-item-type-poll">
            <a href="{router page='question'}add" class="write-item-image"><i class="fa fa-bar-chart fa-fw fa-5x"></i></a>
            <a href="{router page='question'}add" class="write-item-link">{$aLang.block_create_topic_question}</a>
          </li>
          <li class="write-item-type-link">
            <a href="{router page='link'}add" class="write-item-image"><i class="fa fa-link fa-fw fa-5x"></i></a>
            <a href="{router page='link'}add" class="write-item-link">{$aLang.block_create_topic_link}</a>
          </li>
          <li class="write-item-type-photoset">
            <a href="{router page='photoset'}add" class="write-item-image"><i class="fa fa-picture-o fa-fw fa-5x"></i></a>
            <a href="{router page='photoset'}add" class="write-item-link">{$aLang.block_create_topic_photoset}</a>
          </li>
          <li class="write-item-type-blog">
            <a href="{router page='blog'}add" class="write-item-image"><i class="fa fa-folder fa-fw fa-5x"></i></a>
            <a href="{router page='blog'}add" class="write-item-link">{$aLang.block_create_blog}</a>
          </li>
          <li class="write-item-type-draft">
            <a href="{router page='topic'}saved/" class="write-item-image"><i class="fa fa-pencil fa-fw fa-5x"></i></a>
            <a href="{router page='topic'}saved/" class="write-item-link">{$aLang.topic_menu_saved}{if $iUserCurrentCountTopicDraft} ({$iUserCurrentCountTopicDraft}){/if}</a>
          </li>
          {hook run='write_item' isPopup=true}
        </ul>
      </div>
      {/strip}

    </div>
  </div>
</div>
