   M S B A M L   `   `   `  ���� P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  0    *PorcelainInventoryApp.Views.ProductControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   <d2http://schemas.microsoft.com/expression/blend/2008   7local)clr-namespace:PorcelainInventoryApp.Views   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��Products��$��0��$��32(�$��SemiBold"�
���   �$��0 0 0 20q�� $��1��$��	0 10 0 10q� � ColumnDefinitions �� $
��Auto ��� $
��Auto ��� $��* �.+��� -   $��0��   addProductButton#��[  $��0 0 10 0q�.����  �� Orientation$ 
Horizontal=�.+�.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$
 Plus=�$��11��$��11��$��0 1 8 0q��� $��Add Product���� -   $��1��  CatContButton#��[ $��0 0 10 0q�.���� $ 
Horizontal=�.+�  $ Folder=�$��11��$��11��$��0 1 8 0q��� $��Manage Categories��� $��2��$	��250��$��Right=�.+��� -    ��Name$ 	txtSearch��  textboxSearch#��[ �� $��2��$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Sort by:��$��16(�$��Center=�$��0 0 10 0q��� -    ��Name$ SortComboBox��$	��150�� �� SelectedIndex$ 0��.@��� $
��Name���� $��Category���� $��Price���� $��
Date Added��&   System.Windows.Controls.DataGrid  -     Name$ ProductDataGrid��$��3��   AutoGenerateColumns$ False��	   EnableRowVirtualization$
	 True��!
   EnableColumnVirtualization$

 True��   HeadersVisibility$ Column=�   CanUserAddRows$ False��   
IsReadOnly$
 True��$��10(�
�������$��1q�
�������$��0,2,0,8q����� *
Products+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 4  .System.Windows.Controls.DataGridTemplateColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Image��   Width5  /System.Windows.Controls.DataGridLengthConverter$ *    CellTemplate �� .R�(�  (� Stretch$ Uniform=�.���� $	��150��$	��150������  �� Path$ ProductImage�  ByteArrayToImageConverter �� 	Converter# [ 0  *System.Windows.Controls.DataGridTextColumn  $
 Name��$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *ProductName+  $ Category��$ *  �� *Category.CategoryName+  $ Price��$ *  �� *RetailPrice+ �� StringFormat$ 	₱{0:N2}��  $ 
Date Added��$ *  �� *	DateAdded+  $ Actions��$ *  �� .R�� .+��� -   $
��Edit��  
editButton#��[ $��2q��� -   $��Delete��  deleteButton#��[ $��2q�