<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRankEntry.aspx.cs" Inherits="work01.frmRankEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4">
                <h2>Add New Rank</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:FormView ID="FormView1" CssClass="table table-bordered" runat="server" DataKeyNames="rankId" DataSourceID="odsRankEntry" DefaultMode="Insert">
                    <EditItemTemplate>
                        rankId:
                        <asp:TextBox ID="rankIdTextBox" runat="server" Text='<%# Bind("rankId") %>' />
                        <br />
                        rankName:
                        <asp:TextBox ID="rankNameTextBox" runat="server" Text='<%# Bind("rankName") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        
                        Rank Name:
                        <asp:TextBox ID="rankNameTextBox" CssClass="form-control w-25 mb-2" runat="server" Text='<%# Bind("rankName") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Rank Name is Required.  " ControlToValidate="rankNameTextBox" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True">Rank Name can&#39;t be empty!!</asp:RequiredFieldValidator>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-outline-info"/>
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-warning"/>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        rankId:
                        <asp:Label ID="rankIdLabel" runat="server" Text='<%# Bind("rankId") %>' />
                        <br />
                        rankName:
                        <asp:Label ID="rankNameLabel" runat="server" Text='<%# Bind("rankName") %>' />
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:ObjectDataSource ID="odsRankEntry" runat="server" DataObjectTypeName="work01.Models.Rank" InsertMethod="Insert" SelectMethod="GetRanks" TypeName="work01.DAL.RankGetWay"></asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
