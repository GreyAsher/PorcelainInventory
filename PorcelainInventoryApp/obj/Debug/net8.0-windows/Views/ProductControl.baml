   M S B A M L   `   `   `  ����P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  5      0    *PorcelainInventoryApp.Views.ProductControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      7local)clr-namespace:PorcelainInventoryApp.Views   5      .��5      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��Products��6   $��0��6$   $��32(�61   $��SemiBold"�6?   
���   �$��0 0 0 20q�6h   � 5   
   $��1��6   $��	0 10 0 10q�6    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#   �� 5      $��* �6#   .+�5!      �� -   5        $��0��5!         addProductButton#��[  6%   $��0 0 10 0q�6O   .��5"      ��  �� Orientation$ 
Horizontal=�6   .+�5#      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$
 Plus=�6,   $��11��68   $��11��6C   $��0 1 8 0q�6O   �� 5$      $��Add Product��6    5%      5&      �� 5)      -   5        $��1��5)        CatContButton#��[ 6%   $��0 0 10 0q�6L   .��5*      �� $ 
Horizontal=�6   .+�5+        $ Folder=�6,   $��11��6:   $��11��6E   $��0 1 8 0q�6Q   �� 5,      $��Manage Categories��6    5-      5.      � 51      $��2��6   $	��250��6#   $��Right=�6/   .+�52      �� -   5         ��Name$ 	txtSearch��52        textboxSearch#��[ 6-   53      54      �� 57   
   $��2��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�58      �� $��Sort by:��6   $��16(�6(   $��Center=�66   $��0 0 10 0q�6Q   �� 59      -   5         ��Name$ SortComboBox��59      $	��150��6-    �� SelectedIndex$ 0��69   .@�5:      �� $
��Name��6   �� 5;      $��Category��6   �� 5<      $��Price��6   �� 5=      $��
Date Added��6   5>      5?      &   System.Windows.Controls.DataGrid  5B   
   -   5          Name$ ProductDataGrid��5B      $��3��6,      AutoGenerateColumns$ False��69   	   EnableRowVirtualization$
	 True��5C      !
   EnableColumnVirtualization$

 True��62      HeadersVisibility$ Column=�5D         CanUserAddRows$ False��6.      
IsReadOnly$
 True��6E   $��10(�5E      
�������$��1q�64   
�������$��0,2,0,8q�6[   ��5F      �� *
Products+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5H      4  .System.Windows.Controls.DataGridTemplateColumn  5J      ,  &System.Windows.Controls.DataGridColumn   Header$ Image��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 68      CellTemplate 5K      �� 5L      .R�5M      (�  (� Stretch$ Uniform=�6&   .��5N   "   �� $	��150��6(   $	��150��67   ��5O   "   �� 5P   &    �� Path$ ProductImage�6.     ByteArrayToImageConverter �� 	Converter# [ 6B   5R   #   5S      5T      5V      0  *System.Windows.Controls.DataGridTextColumn  5X      $
 Name��6%   $ * 6S   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *ProductName+6S     5Y      $ Category��6%   $ * 6a    67   �� *Category.CategoryName+6a     5Z      $ Price��6%   $ * 6l    64   �� *RetailPrice+ �� StringFormat$ 	₱{0:N2}��6l     5[      $ 
Date Added��6%   $ * 6W    69   �� *	DateAdded+6W     5_      $ Actions��6)   $ * 6:    5`      �� 5a      .R�5b      � .+�5c   "   �� -   5        $
��Edit��5c   )     
editButton#��[ 68   $��2q�6\   6g   �� 5d   "   -   5        $��Delete��5d   )     deleteButton#��[ 6:   $��2q�6`   6k   5e      5f      5h      5k      5l      5m      