<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="placement.aspx.cs" Inherits="PlacementCell.placement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="style/StyleSheet.css" rel="stylesheet" />
    <link href="style/material.css" rel="stylesheet" />
    <link href="style/material.min.css" rel="stylesheet" />
    <script src="style/material.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
    <form id="form1" runat="server">
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
        <header class="mdl-layout__header mdl-color--grey-100 mdl-color-text--cyan">
        <div class="mdl-layout__header-row">
          <span class="mdl-layout-title">Home</span>
          <div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i id="search_icon" class="material-icons">search</i>
            </label>
              <%--<div class="mdl-tooltip" for="search_icon">Search</div>--%>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" placeholder="Enter Your Query" id="search">
            </div>
          </div>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i id="more_vert_icon" class="material-icons">more_vert</i>
          </button>
            <%--<div class="mdl-tooltip" for="more_vert_icon">Options</div>--%>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">About</li>
            <li class="mdl-menu__item">Contact</li>
            <li class="mdl-menu__item">Legal information</li>
          </ul>
        </div>
      </header>
        <div class="mdl-layout__drawer mdl-color--cyan mdl-color-text--blue-grey-50">
           <header class="demo-drawer-header">
            <i id="demo-avtaar"class="material-icons">account_circle</i>
            <div class="demo-avatar-dropdown">
            <span>hello@example.com</span>
            <div class="mdl-layout-spacer"></div>
            <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_drop_down</i>
              <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
              <li class="mdl-menu__item">hello@example.com</li>
              <li class="mdl-menu__item">info@example.com</li>
              <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
            </ul>
          </div>
        </header>
        </div>
    </div>
    </form>
</body>
</html>
