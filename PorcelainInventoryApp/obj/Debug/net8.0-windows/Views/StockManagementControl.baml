   M S B A M L   `   `   `  ����P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  5      8    2PorcelainInventoryApp.Views.StockManagementControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      7local)clr-namespace:PorcelainInventoryApp.Views   5      .��5      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��Stock Management��6   $��0��6,   $��32(�69   $��SemiBold"�6G   
���   �$��0 0 0 20q�6p   � 5   
   $��1��6   $��	0 10 0 10q�6    � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $	��250 �6#   .+�5      �� $��0��6    �� Orientation$ 
Horizontal=�6)   .+�5       �� $��	Sort by: ��6   $��16(�6-   $��Center=�6;   $��0 0 10 0q�6V   �� 5!      -   5         ��Name$ SortComboBox��5!      $	��150��61    �� SelectedIndex$ 0��6=   $��25��6O   .@�5"      �� $
��Name��6#   �� 5#      $��Stock Quantity��6#   �� 5$      $��Last Updated��6#   5%      5&      � 5)      $��1��6   .+�5*      �� -   5         ��Name$ 	txtSearch��5*         textboxSearch#��[  6-   5+      5,      &   System.Windows.Controls.DataGrid  5/   
   -   5          Name$ dgStockItems��5/      $��3��6)      AutoGenerateColumns$ False��66   $
��True��6R   $��10(�50         HeadersVisibility$ Column=�6!   	   CanUserAddRows$	 False��6<   
   
IsReadOnly$

 True��6S   
�������$��1q�51   &   
�������$��0 0 0 10q�6M   ��52      �� *
Products+   Columns 54      0  *System.Windows.Controls.DataGridTextColumn  55      ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6[   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   �� *ProductName+6[   4  .System.Windows.Controls.DataGridTemplateColumn  58      $ Stock��6)   $ * 68      CellTemplate 59      �� 5:      .R�5;      �� $
��Bold"�6G   ��6(   �� *StockQuantity+��5<   "   �� 5=   &    �� 
TargetType" ��6,   .�5>   *   ��  �� Property � �� �� Value
 � � �6G    �� Triggers 5?   *   �� 5@   .    �� Binding 6:   �� *StockQuantity+ �� Value 06\   .a�5A   2   ��  � ��
 �  ��6O   5B   /   5D   '   5F      5G      5I        5K      $ Stock Status��6)   $ * 6?    5L      �� 5M      .R�5N      �� $
��Bold"�6E   ��6(   �� *StockStatus+��5O   "   �� 5P   &   " ��6,   .�5Q   *   ��  � ��
 �   �6G    5R   *   �� 5S   .    6:   �� *StockStatus+ Out of Stock6Z   .a�5T   2   ��  � ��
 �  ��6O   5U   /   �� 5V   .    6:   �� *StockStatus+ In Stock6Z   .a�5W   2   ��  � ��
 � � �6O   5X   /   5Z   '   5\      5]      5_        5b      $ Last Updated��6%   $ * 6[    6;   �� *DateUpdated+6[     5g      $ Actions��6)   $	 140 6:    5h      �� 5i      .R�5j      �� $ 
Horizontal=�6)   .+�5k   "   �� -   5        $��	Add Stock��5k   )     editStockButton#��[ 6=   $��2q�6f   6q   5l      5m      5o      5q      5r      5s      