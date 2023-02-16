<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAllRank.aspx.cs" Inherits="work01.frmAllRank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4">
                <h2>All Rank</h2>
                <div class="d-flex justify-content-end mb-3">
                    <a href="frmRankEntry.aspx" class="btn btn-outline-info">Add New</a>
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="rankId" DataSourceID="dsAllRank">
                    <Columns>
                        <asp:BoundField DataField="rankId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="rankId" />
                        <asp:BoundField DataField="rankName" HeaderText="Rank" SortExpression="rankName" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-outline-success"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-warning"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-outline-info"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-outline-danger"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsAllRank" runat="server" ConnectionString="<%$ ConnectionStrings:AirmanDB2ConnectionString %>" DeleteCommand="DELETE FROM [tbl_Rank] WHERE [rankId] = @rankId" InsertCommand="INSERT INTO [tbl_Rank] ([rankName]) VALUES (@rankName)" SelectCommand="SELECT * FROM [tbl_Rank]" UpdateCommand="UPDATE [tbl_Rank] SET [rankName] = @rankName WHERE [rankId] = @rankId">
                    <DeleteParameters>
                        <asp:Parameter Name="rankId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="rankName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="rankName" Type="String" />
                        <asp:Parameter Name="rankId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
