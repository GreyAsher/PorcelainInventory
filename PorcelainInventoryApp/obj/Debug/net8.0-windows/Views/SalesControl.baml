   M S B A M L   `   `   `  ����P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  5      .    (PorcelainInventoryApp.Views.SalesControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      7local)clr-namespace:PorcelainInventoryApp.Views   5      .��5      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��Sales Transactions��6   $��0��6.   $��32(�6;   $��SemiBold"�6I   
���   �$��0 0 0 20q�6r   � 5   
   $��1��6   $��	0 10 0 10q�6    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#   �� 5      $��* �6#   .+�5       �� -   5        $��0��5          addInvoiceButton#��[  6%   $��0 0 10 0q�6O   .��5!      ��  �� Orientation$ 
Horizontal=�6   .+�5"      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ FileDocument=�6,   $��11��6@   $��11��6K   $��0 1 8 0q�6W   �� 5#      $��New Invoice��6    5$      5%      � 5(      $��2��6   $	��250��6#   $��Right=�6/   .+�5)      �� -   5         ��Name$ 	txtSearch��5)        textboxSearch#��[ 6-   5*      5+      �� 5.   
   $��2��6   $ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�5/      �� $��Sort by:��6   $��16(�6(   $��Center=�66   $��0 0 10 0q�6Q   �� 50      $	��150��6    �� SelectedIndex$ 0��6#   .@�51      �� $
��Date��6   �� 52      $��Total Amount��6   �� 53      $��Customer Name��6   �� 54      $��Payment Method��6   55      56      &   System.Windows.Controls.DataGrid  59   
   -   5          Name$ dgSales��59      $��3��5:         AutoGenerateColumns$ False��5;      $��15(�5<      $
��True��5=         HeadersVisibility$ Column=�5>      	   CanUserAddRows$	 False��5?      
   
IsReadOnly$

 True��5@      
�������$��1q�5B      
�������$��0 0 0 10q�5D      ��5E      �� *
Invoices+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5F      0  *System.Windows.Controls.DataGridTextColumn  5G      ,  &System.Windows.Controls.DataGridColumn   Header$ Transaction ID��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6[   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6=   �� *	InvoiceID+6[   4  .System.Windows.Controls.DataGridTemplateColumn  5K      $ Actions��6)   $
 auto 6:      CellTemplate 5L      �� 5M      .R�5N      �� $ 
Horizontal=�6)   .+�5O   "   �� -   5        $��	View Info��5O   )     viewInvoiceButton#��[ 6=   $��2q�6h   6s   5P      5Q      5S      5U      5V      5W      