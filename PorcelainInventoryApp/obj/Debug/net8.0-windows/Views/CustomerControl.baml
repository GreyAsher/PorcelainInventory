   M S B A M L   `   `   `  ����P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  5      1    +PorcelainInventoryApp.Views.CustomerControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      7local)clr-namespace:PorcelainInventoryApp.Views   5      .��5      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��Customer Management��6   $��0��6/   $��32(�6<   $��SemiBold"�6J   $��0 0 0 20q�6`   � 5   
   $��1��6   $��	0 10 0 10q�6    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $��* �6#   .+�5      �� -   5        $��0��5         	addButton#��[  6%   $��0 0 10 0q�6H   .��5       ��  �� Orientation$ 
Horizontal=�6   .+�5!      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ 
PlusCircle=�6,   $��16��6>   $��16��6I   $��0 1 8 0q�6U   �� 5"      $��Add Customer��6    5#      5$      � 5'      $��1��6   $	��250��6#   $��Right=�6/   .+�5(      �� -   5         ��Name$ 	txtSearch��5(        textboxSearch#��[ 6n   ��6-   �� *
SearchText+ �� UpdateSourceTrigger$ PropertyChanged=�6n   5)      5*      �� 5-   
   $��2��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5.      �� $��Sort by:��6   $��16(�6(   $��Center=�66   $��0 0 10 0q�6Q   �� 5/      $	��150��6    �� SelectedItem 6#   �� *
SortOption+.@�50      �� $
��Name��6   �� 51      $��Last Purchase��6   �� 52      $��
Date Added��6   53      54      &   System.Windows.Controls.DataGrid  57   
   -   5          Name$ dgCustomers��57      $��3��6(      AutoGenerateColumns$ False��65   $��10(�58      	   HeadersVisibility$	 Column=�59      
   CanUserAddRows$
 False��6.      
IsReadOnly$
 True��6E   
�������$��1q�5:   &   
�������$��0 0 0 10q�6M   ��5;      �� *	Customers+$ PropertyChanged=�   Columns 5=      0  *System.Windows.Controls.DataGridTextColumn  5>      ,  &System.Windows.Controls.DataGridColumn   Header$ Customer Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6Y   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6<   �� *
FullName+6Y     5?      $ Email��6%   $ * 6N    64   �� *Email+6N     5@      $ Phone��6%   $ * 6V    64   �� *ContactNumber+6V   4  .System.Windows.Controls.DataGridTemplateColumn  5E      $ Actions��6)   $ * 6:      CellTemplate 5F      �� 5G      .R�5H      �� $ 
Horizontal=�6)   .+�5I   "   �� -   5        $
��Edit��5I   )     
editButton#��[ 68   $��2q�6|   ��6\   �� *EditCommand+6�   �� 5J   "   -   5        $��Delete��5J   )     deleteButton#��[ 6:   $��2q�6�   ��6`   �� *DeleteCommand+6�   5K      5L      5N      5P      5Q      5R      