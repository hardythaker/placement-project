<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="dataUpdatedSuccessfully.aspx.cs" Inherits="PlacementCell.dataUpdatedSuccessfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" method="post">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text">Thank You</h2>
            </div>
            <br />
            <div style="display:inline-flex;align-self:center">
                <span style="padding-top:0px" class="material-icons mdl-color-text--accent">thumb_up</span>
                &nbsp;
                <p class="mdl-typography--title-color-contrast mdl-color-text--accent mdl-typography--font-bold mdl-typography--text-capitalize mdl-typography--text-center">
                    You have Successfully Updated Your Data
                </p>
            </div>
            <div>
                <div style="padding: 8px 5px 20px 5px">
                    <a class="mdl-button mdl-button--colored mdl-color--primary mdl-color-text--white mdl-js-button mdl-js-ripple-effect" href="home.aspx">
                        <span class="material-icons">home</span>
                        Goto Home Page
                    </a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
