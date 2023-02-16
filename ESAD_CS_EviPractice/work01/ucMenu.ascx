<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMenu.ascx.cs" Inherits="work01.ucMenu" %>
<asp:Menu ID="Menu1" runat="server" Width="100%" BackColor="#996633" Font-Size="1.2em" ForeColor="White" Orientation="Horizontal">
            <Items>
                <asp:MenuItem NavigateUrl="~/Default.aspx" Text="Home" Value="Home"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/frmAllRank.aspx" Text="Rank" Value="Rank"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/frmAllAirman.aspx" Text="Airman" Value="Airman"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#FF9900" ForeColor="Black" />
            <StaticMenuItemStyle HorizontalPadding="1.5em" VerticalPadding="1.5em" />
            <StaticMenuStyle HorizontalPadding="2em" />
        </asp:Menu>