   M S B A M L   `   `   `  ����  PorcelainInventoryApp>    8PorcelainInventoryApp.Views.AddWindows.AddCategoryWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  Add Category��5   	   $	��261��6   $	��400��6+    � WindowStartupLocation$ CenterScreen=�67    � 
ResizeMode$ NoResize=�5   	    � WindowStyle$
 None=�6   .��5      �� 
�������$��2q�6     �� CornerRadius$ 10��64   
������� �� Padding$ 10q�6Y   ._�5	   
   � $��10q�6    � RowDefinitions 5
      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $��* �6    .+�5      �� -   5         ��Name$ txtCategoryTitle��5      $��Add Category��62   $��20(�6F   $��SemiBold"�6T   
���   �$��0��6}   �� 5      $��1��6    �� Orientation$ Vertical=�6&   $��	0 10 0 10q�6=   .+�5      �� $��Category Name:��6   $
��Bold"�62   $��0 0 0 5q�6D   �� 5      -   5        	 ��Name$	 txtCategoryName��5      $��30��63   $	��340��6?   
�������$��1q�6^   5      �� 5      $��2��6   $ Vertical=�6&   $��	0 10 0 10q�6=   �� 5      $��3��6   $ 
Horizontal=�6&   $��Right=�6?   $��0 10 0 0q�6[   .+�5       �� -   5        
 ��Name$
 btnSave��5          
saveButton#��[  6*   $��80��6N   $��30��6Y   ���#007FFF
�������$��5q�6�   6�   �� 5!      -   5        $
 	btnCancel��5!        cancelButton#��[ 6,   $��Cancel��6R   $��80��6c   $��30��6n   
�������
�������$��5q�6�   6�   5"      5#      5$      5%      