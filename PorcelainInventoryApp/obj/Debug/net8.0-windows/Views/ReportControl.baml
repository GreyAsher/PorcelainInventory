   M S B A M L   `   `   `  ����P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  5      /    )PorcelainInventoryApp.Views.ReportControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      7local)clr-namespace:PorcelainInventoryApp.Views   5      .��5      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��Sales and Reports��6   $��0��6-   $��28(�6:   $��SemiBold"�6H   
���   �$��0 0 0 20q�5   '   � 5   
   $��1��6   $��	0 10 0 10q�6    � ColumnDefinitions 5      �� 5       $��* �6#   �� 5!      $
��Auto �6#   .+�5%      ��  �� Orientation$ 
Horizontal=�6   $��Center=�62   .+�5&      �� $��
Filter by:��6   $��14(�6.   $��Center=�6<   $��0 0 10 0q�6W   (  "System.Windows.Controls.DatePicker  5'      $	��150��6   $��0 0 10 0q�6)      SelectedDate 6;   �� *	StartDate+ �� Mode$ TwoWay=�  5(      $	��150��6   $��0 0 10 0q�6)    6;   �� *	EndDate+$ TwoWay=��� 5)      $	��150��6    �� SelectedItem 6'   �� *SelectedCategory+$ TwoWay=�.@�5*      �� $��All Categories��6#   �� 5+      $��Porcelain Vases��6#   �� 5,      $��
Dinnerware��6#   �� 5-      $��Decorative Items��6#   5.      �� 5/      $��Apply Filter��6   $��10 0 0 0q�6W   ��60   �� *ApplyFilterCommand+6W   50      �� 53      $��1��6      exportButton#��[  6%   $��10 0 0 0q�6s   ��6K   �� *ExportReportCommand+.��54      �� $ 
Horizontal=�6   .+�55      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ 
FileExport=�6,   $��16��6>   $��16��6I   $��0 1 8 0q�6U   �� 56      $��Export Report��6    57      58      59      � 5<   
   $��2��6   $��	0 10 0 10q�6    5=      �� 5>      $��* �6#   �� 5?      $��* �6#   �� 5@      $��* �6#   .+�5D      �� $��0��6   
�������$��1q�68    �� CornerRadius$ 5��6L    �� Padding$ 10q�6]   $��5q�6j   ._�5E      �� $��Center=�6   .+�5F      �� $��Total Sales��6    $��16(�63   $
��Bold"�6A   	 �� TextAlignment$	 Center=�6S   �� 5G      $��24(�5H       $��SemiBold"�6.   
��� � �$	 Center=�6W   ��5G       �� *
TotalSales+
 �� StringFormat$
 	₱{0:N2}��5H   W   5I      5J      �� 5M      $��1��6   
�������$��1q�68   $ 5��6L   $ 10q�6]   $��5q�6j   ._�5N      �� $��Center=�6   .+�5O      �� $��Total Customers��6    $��16(�67   $
��Bold"�6E   $	 Center=�6W   �� 5P      $��24(�6@   $��SemiBold"�6N   
����  �$	 Center=�5Q   2   ��5P       �� *TotalCustomers+5Q   2   5R      5S      �� 5V      $��2��6   
�������$��1q�68   $ 5��6L   $ 10q�6]   $��5q�6j   ._�5W      �� $��Center=�6   .+�5X      �� $��Best-Selling Product��6    $��16(�6<   $
��Bold"�6J   $	 Center=�6\   �� 5Y      $��18(�6D   $��SemiBold"�6R   $	 Center=�6h   ��6    �� *BestSellingProduct+6h   5Z      5[      5\      �� 5_   
   $��4��6   
�������$��1q�61   $ 5��6E   $ 10q�6V   ._�5`      &   System.Windows.Controls.DataGrid  -   5          Name$ dgSales��5`         AutoGenerateColumns$ False��6(      HeadersVisibility$ Column=�5a         CanUserAddRows$ False��62      
IsReadOnly$
 True��6I   
���������5b   *   �� *SalesReports+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5c      0  *System.Windows.Controls.DataGridTextColumn  5d      ,  &System.Windows.Controls.DataGridColumn   Header$ Invoice No.��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6\   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6>   �� *	InvoiceID+6\     5e      $ Customer��6)   $ * 6a    6;   �� *Customer.FullName+6a     5f      $ Total Amount��6)   $ * 6w    6?   �� *TotalAmount+$
 	₱{0:N2}��6w     5g      $
 Date��6)   $ * 6V    67   �� *
DateIssued+6V   5k      5l      5m      5n      