   M S B A M L   `   `   `  ����P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  5      1    +PorcelainInventoryApp.Views.SupplierControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      7local)clr-namespace:PorcelainInventoryApp.Views   5        � 	Resources  5         	BoolToVis��%   &	        �� 5   
   6'   5      .��5      � $��20q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��Supplier Management��6   $��32(�6/   $��SemiBold"�6=   $
��Left=�5      
���   �$��0 0 0 20q�6B   �� 5   
    �� Orientation$ 
Horizontal=�6   $��1��6.   $��Stretch=�6;   $��0 0 0 10q�6Y   .+�5      �� -   5          	addButton#��[ 5      $��0 0 10 0q�68   .��5       �� $ 
Horizontal=�6   .+�5!      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$
 Plus=�6,   $��Center=�68   $��16��6S   $��16��6^   $��0 1 8 0q�6j   �� 5"      $��Add Supplier��6    5#      5$      � 5'      $	��250��6   $��Right=�6   .+�5(      �� $
��15 0q�6   $��Center=�6*   
������� J� IsHitTestVisible$ False��5)      $��Search Supplier...��65   y�5*      ��  �� ElementName$ 	txtSearch�� �� Path$ Text.IsEmpty� �� 	Converter# [  �� 5,      -   5         ��Name$ 	txtSearch��5,        textboxSearch#��[ 6-   5-      5.      &   System.Windows.Controls.DataGrid  51   
   -   5        	  Name$	 SupplierGrid��51      $��3��6)   
   AutoGenerateColumns$
 False��66   $��10(�6R      HeadersVisibility$ Column=�52         CanUserAddRows$ False��6'      
IsReadOnly$
 True��6>   
�������$��1q�53      
�������$��0 0 0 10q�6F   ��54      �� *	Suppliers+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 56      0  *System.Windows.Controls.DataGridTextColumn  58      ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6T   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *SupplierName+6T     59      $ Contact Number��6%   $ * 6_    6=   �� *ContactNumber+6_     5:      $ Address��6%   $ * 6R    66   �� *	Address+6R   4  .System.Windows.Controls.DataGridTemplateColumn  5>      $ Actions��6)   $ * 6:      CellTemplate 5?      �� 5@      .R�5A      �� $ 
Horizontal=�6)   .+�5B   "   �� -   5        $
��Edit��5B   )     
editButton#��[ 68   $��2q�6\   6g   �� 5C   "   -   5        $��Delete��5C   )     deleteButton#��[ 6:   $��2q�6`   6k   5D      5E      5G      5I      5J      5K      