<!DOCTYPE html>

<html class="no-js" lang="ru-RU" />

<head>
  {hook run='html_head_begin'}

  <meta charset="utf-8" />
  <!--[if IE]>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <![endif]-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>{$sHtmlTitle}</title>

  <meta name="description" content="{$sHtmlDescription}" />
  <meta name="keywords" content="{$sHtmlKeywords}" />

  {$aHtmlHeadFiles.css}

  <link href="{cfg name='path.static.skin'}/images/favicon.ico?v1" rel="shortcut icon" />
  <link rel="search" type="application/opensearchdescription+xml" href="{router page='search'}opensearch/" title="{cfg name='view.name'}" />


  {if $bRefreshToHome}
    <meta  HTTP-EQUIV="Refresh" CONTENT="3; URL={cfg name='path.root.web'}/">
  {/if}


  <script type="text/javascript">
    var DIR_WEB_ROOT            = '{cfg name="path.root.web"}';
    var DIR_STATIC_SKIN         = '{cfg name="path.static.skin"}';
    var DIR_ROOT_ENGINE_LIB     = '{cfg name="path.root.engine_lib"}';
    var LIVESTREET_SECURITY_KEY = '{$LIVESTREET_SECURITY_KEY}';
    var SESSION_ID              = '{$_sPhpSessionId}';
    var BLOG_USE_TINYMCE        = '{cfg name="view.tinymce"}';

    var TINYMCE_LANG = 'en';
    {if $oConfig->GetValue('lang.current') == 'russian'}
      TINYMCE_LANG = 'ru';
    {/if}

    var aRouter = new Array();
    {foreach from=$aRouter key=sPage item=sPath}
      aRouter['{$sPage}'] = '{$sPath}';
    {/foreach}
  </script>


  {$aHtmlHeadFiles.js}


  <script type="text/javascript">
    var tinyMCE = false;
    ls.lang.load({json var = $aLangJs});
    ls.registry.set('comment_max_tree',{json var=$oConfig->Get('module.comment.max_tree')});
    ls.registry.set('block_stream_show_tip',{json var=$oConfig->Get('block.stream.show_tip')});
  </script>


  {hook run='html_head_end'}
</head>


{if $oUserCurrent}
  {assign var=body_classes value=$body_classes|cat:' ls-user-role-user'}

  {if $oUserCurrent->isAdministrator()}
    {assign var=body_classes value=$body_classes|cat:' ls-user-role-admin'}
  {/if}
{else}
  {assign var=body_classes value=$body_classes|cat:' ls-user-role-guest'}
{/if}

{if !$oUserCurrent or ($oUserCurrent and !$oUserCurrent->isAdministrator())}
  {assign var=body_classes value=$body_classes|cat:' ls-user-role-not-admin'}
{/if}


<body class="{$body_classes} light {if {cfg name='view.theme_bg'} == 'true'}theme-bg{/if}">
  {hook run='body_begin'}

  <div class="container">

    <hgroup class="center-block site-info">
      <h1 class="text-center site-name">
        <a href="{cfg name='path.root.web'}">
          {if {cfg name='view.config_sitename'} == true}
            {cfg name='view.name'}
          {else}
            {cfg name='view.own_sitename'}
          {/if}
        </a>
      </h1>

      <p class="text-center lead site-description">{cfg name='view.description'}</p>
    </hgroup>

    <div class="center-block light-form">
