   M S B A M L   `   `   `  ���� P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  S.clr-namespace:PorcelainInventoryApp.ViewModels PorcelainInventoryApp.ViewModels  ;    5PorcelainInventoryApp.Views.CategoryManagementControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   <d2http://schemas.microsoft.com/expression/blend/2008   7local)clr-namespace:PorcelainInventoryApp.Views   9vm.clr-namespace:PorcelainInventoryApp.ViewModels   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��   pagingButton#��[  $
��Left=�$	��Top=�$��0,0,0,10q�.����  �� Orientation$ 
Horizontal=�.+�.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ 	ArrowLeft=�$��16��$��16��$��0 1 8 0q��� $
��Back��$��80���� $��1��$��Category Management��$��28(�$��SemiBold"�
���   �$��	0 10 0 20q�� $��2��$��	0 10 0 10q� � ColumnDefinitions �� $
��Auto ��� $��* �.+��� -   $��0��  addCategoryButton#��[ $��0 0 10 0q�.���� $ 
Horizontal=�.+�  $
 Plus=�$��11��$��11��$��0 1 8 0q��� $��Add New Category��� $��1��$	��250��$��Right=�.+��� -    ��Name$ 	txtSearch��  textboxSearch#��[ &   System.Windows.Controls.DataGrid  -     Name$ dgCategories��$��3��   AutoGenerateColumns$ False��   HeadersVisibility$ Column=�   CanUserAddRows$ False��	   
IsReadOnly$
	 True��$��11(�
�������$��1q�
�������$��0 0 0 10q����� *
Categories+
 �� UpdateSourceTrigger$
 PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Category Name��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *CategoryName+4  .System.Windows.Controls.DataGridTemplateColumn  $ Actions��$ *    CellTemplate �� .R��� $ 
Horizontal=�.+��� -   $
��Edit��  
editButton#��[ $��2q��� -   $��Delete��  deleteButton#��[ $��2q�