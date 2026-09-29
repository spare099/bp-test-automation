@JenkinRun
Feature: PlannerProposedChanges_functionalities

@BP-3402 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Ramya
Scenario: Verify Approve Release Drops at style level work well
    Given I Login to BuyPlan Application as Planner
	#Create Drop
	And I open ProductSummary page for department 004
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter 04NS27LSL542 into  DropsProductNumberField text input field
	And I click on SEARCH_BUTTON button

	And I click on zeroDropQuantityLocation link
	And I enter DropQuantity into quantityInputField text field
	And I enter SplitPercentage into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on ManagePackButton button


	And I enter TestPackName into PackNameTextField text field
	And I enter RatioPackSize
	And I click on ManagePackSave button
	And I verify that PackNameLabel contains text TestPackName
	
	# #select the pack created for the AUS and NZD
	And I click on BackToDrop button
	And I click on Checkbutton_TestPackName button
	And I click on NewZealandTab link
	And I click on Checkbutton_TestPackName button
	# And I click on DropEditSaveChanges button
	# And I click on DropStateReleased link
	# And I click on UpdateStatus button
	# And I click on DropEditSaveChanges button
	# And I click on DropEditClose button
	# And I am back to drops page
	
	# #KAS Approval at style level
	# And I navigate to FactoryCapacityPlanning page as KAS user
	# And I click on SelectHalf link
	# And I click on KasPendingApproval button
	# And I click on KishaniTestFactory link
	# And I click on ProductCheckbox of the ProductName
	# And I verify that ApproveSelectionButton is Present
	# And I verify that RejectSelectionButton is Present
	# And I click on ApproveSelection button

	# #Verify That drop is in Approved Sate
	# And I navigate to Drops page as Planner
	# And I click on SelectHalf link
	# And I enter ProductName into  DropsProductNumberField text input field
	# And I click on DropsSearch link
	# And I scroll down the page
	# And I verify that Drop is in Approved Status

	

@BP-3417 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Ramya
Scenario: BP-3417_PPC_Verify whether KAS user is able to approve Planner Proposed Changes when Total Drop Quantity is updated to non-zero value at style level work well_Approved Drop
	
	Given Login to BuyPlan Application as Planner
	#Create Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on ManagePackButton button

	#Add pack and verify it 
	And I enter TestPackName into PackNameTextField text field
	And I enter SmallSize into  RatioSmallSize text input field
	And I click on ManagePackSave button
	And I verify that PackNameLabel contains text TestPackName
	
	
	#select the pack created for the AUS and NZD
	And I click on BackToDrop button
	And I click on TestPack of the TestPackName
	And I click on NewZealandTab link
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	#And I wait till BuyPlan loading is complete
	#And I click on SelectHalf link
	And I wait till BuyPlan loading is complete
	And I click on KasPendingApproval button
    And I wait till BuyPlan loads
	And I click on KishaniTestFactory link
	And I wait till BuyPlan loading is complete
	And I click on ProductCheckbox of the ProductName
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button
	And I wait till BuyPlan loading is complete

	#Create a what if on approved drop with the quantity change
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loading is complete
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter DropEditQunatity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button

	#Kas Approval for Planner What If
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I wait till BuyPlan loading is complete
	#And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I wait till BuyPlan loading is complete
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loading is complete
	And I click on ProductCheckbox of the ProductName
	And I click on ApproveSelectionButton button

	#Verify that approved drop is persent with the updated quantity
    And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I verify that DropCreated contains textas DropEditQunatity




@BP-3420 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Ramya
Scenario: BP-3420_PPC_Verify whether KAS user is able to approve the Planner proposed change when one of the Split quantity is made Zero_Approved Drop
	
	Given Login to BuyPlan Application as Planner
	#Create Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on ManagePackButton button

	#Add pack and verify it 
	And I enter TestPackName into PackNameTextField text field
	And I enter SmallSize into RatioSmallSize text input field
	And I click on ManagePackSave button
	And I verify that PackNameLabel contains text TestPackName
	
	
	#select the pack created for the AUS and NZD
	And I click on BackToDrop button
	And I click on TestPack of the TestPackName
	And I click on NewZealandTab link
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I click on ProductCheckbox of the ProductName
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

	#Create a what if on approved drop with the quantity change
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter Zeroqunatity into QuantityAusTextField text field
	And I click on DropEditSaveChanges button
	And I wait till BuyPlan loads
	And I click on DropEditClose button
	And I wait till BuyPlan loads
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I wait till BuyPlan loads


	#Kas Approval for Planner What If
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loading is complete
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loading is complete
	And I click on ProductCheckbox of the ProductName
	And I click on ApproveSelectionButton button

	#Verify that approved drop is persent with the updated quantity
    And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I verify that DropCreated contains textas DropEditQunatity

@BP-3423 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Ramya
Scenario: BP-3423_PPC_Verify whether KAS user is able to approve the Planner proposed change with total Drop Quantity made Zero_PO Drop

	Given Login to BuyPlan Application as Planner
	#Create Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on ManagePackButton button

	#Add pack and verify it 
	And I enter TestPackName into PackNameTextField text field
	And I enter SmallSize into  RatioSmallSize text input field
	And I click on ManagePackSave button
	And I verify that PackNameLabel contains text TestPackName
	
	
	#select the pack created for the AUS and NZD
	And I click on BackToDrop button
	And I click on TestPack of the TestPackName
	And I click on NewZealandTab link
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I click on ProductCheckbox of the ProductName
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I wait till BuyPlan loading is complete
	And I click on SelectHalf link
	And I enter ProductName into  ProductNumberSearchTextPO text input field
	And I wait till BuyPlan loading is complete
	
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
	
 And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	
	#Create a what if on PO drop with the  zero quantity change
	And I click on whatIfButton button
	And I wait till BuyPlan loading is complete
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter DropEditQunatity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button

	#Kas Approval for Planner What If
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loading is complete
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loading is complete
	And I click on ProductCheckbox of the ProductName
	And I click on ApproveSelectionButton button

	#Verify that  drop is persent with the zero quantity(No Drop)
    And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that DropCreated contains textas DropEditQunatity

@BP-3424 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Ramya
Scenario: BP-3424_PPC_Verify whether KAS user is able to approve the Planner proposed change with Global Update in Drop Quantity to non-zero value_PO Drop
	
	Given Login to BuyPlan Application as Planner
	#Create Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on ManagePackButton button

	#Add pack and verify it 
	And I enter TestPackName into PackNameTextField text field
	And I enter SmallSize into  RatioSmallSize text input field
	And I click on ManagePackSave button
	And I verify that PackNameLabel contains text TestPackName
	
	
	#select the pack created for the AUS and NZD
	And I click on BackToDrop button
	And I click on TestPack of the TestPackName
	And I click on NewZealandTab link
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I click on ProductCheckbox of the ProductName
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I wait till BuyPlan loading is complete
	And I click on SelectHalf link
	And I enter ProductName into  ProductNumberSearchTextPO text input field
	And I wait till BuyPlan loading is complete
	
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
    And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	
	#Create a what if on PO drop with the  non zero quantity change
	And I click on whatIfButton button
	And I wait till BuyPlan loading is complete
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter DropEditQunatity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button

	#Kas Approval for Planner What If
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loading is complete
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loading is complete
	And I click on ProductCheckbox of the ProductName
	And I click on ApproveSelectionButton button

	#Verify that  drop is persent with the edited quantity
    And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I verify that DropCreated contains textas DropEditQunatity

@BP-3425 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Ramya
Scenario: BP-3425_PPC_Verify whether KAS user is able to approve the Planner proposed change with Update in DC Due date for one of the Splits_PO Drop
	Given Login to BuyPlan Application as Planner
	#Create Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on ManagePackButton button

	#Add pack and verify it 
	And I enter TestPackName into PackNameTextField text field
	And I enter SmallSize into  RatioSmallSize text input field
	And I click on ManagePackSave button
	And I verify that PackNameLabel contains text TestPackName
	
	
	#select the pack created for the AUS and NZD
	And I click on BackToDrop button
	And I click on TestPack of the TestPackName
	And I click on NewZealandTab link
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I click on ProductCheckbox of the ProductName
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I wait till BuyPlan loading is complete
	And I click on SelectHalf link
	And I enter ProductName into  ProductNumberSearchTextPO text input field
	And I wait till BuyPlan loading is complete
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
    And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	

	#Raise WhatIf - change in DC Due date for one of the Splits
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I select NextAvailableDcDuedate from OrderDcDueDate dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	
	#KAS Approval for Planner Whatif on approved drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loading is complete
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loading is complete
	And I click on ProductCheckbox of the ProductName
	And I click on ApproveSelectionButton button
	And I wait for "200000" milliseconds
	
	#Verify the updated DC due date for PO
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in PurchasedOrder Status
	And I verify that UpdatedDrop is in PurchasedOrder Status

@BP-3426 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-3426_PPC_Verify whether KAS user is able to Approve Planner Proposed Changes when DC due date of one of the split is changed_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Planner What If
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I select NextAvailableDcDuedate from OrderDcDueDate dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on approved drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button
	#Verify the updated DC due date
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in Approved Status
	And I verify that UpdatedDrop is in Approved Status
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on the OldDropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-3588 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-3588_PPC_Verify whether KAS user is able to approve Planner proposed change when DC Due date is updated at Drop level_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I scroll down the page
	And I wait till BuyPlan loads
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf - change in DC Due date for one of the Splits
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I select NextAvailableDcDuedate from DropDcDueDate dropdown
	#And I select "PD06WK05F21" from DcDueDateGlobal dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button
	And I wait for "200000" milliseconds
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Clean Up
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-3589 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-3589_PPC_Verify whether KAS user is able to approve Planner proposed change when Drop Quantity of one of the split is updated to non-zero value_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I wait till BuyPlan loads
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf - change in quantity of one of the Split
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter EditedAUSOrderQuantity into AusQuantityTextField text field
	And I wait till BuyPlan loads
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I wait till BuyPlan loads
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval of WhatIf
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loads
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button
	And I wait for "200000" milliseconds
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Clean Up
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I verify AUSOrderQuantity textfield contains UpdatedAUSOrderQuantity
	And I click on NewZealandTab link
	And I verify PreviousNZLDropQuantity textfield contains NZLOrderQuantity
	And I verify DropQuantity textfield contains UpdatedDropQuantity
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-3590 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-3590_PPC_Verify whether KAS user is able to approve Planner Proposed Changes when Total Drop Quantity is made Zero_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	#Release the drop
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise WhatIf - Update the total drop quantity to Zero- Takes cae of cleanup
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter UpdatedDropQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button
	#Verify that drop is deleted from DC due date
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in NoStatus Status

@BP-3591 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-3591_PPC_Verify whether KAS user is able to Approve Planner Proposed Changes when DC due date is updated at Drop level_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise WhatIf - Update the DC Due date
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I select NextAvailableDcDuedate from DropDcDueDate dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button
	#Clean Up
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-3600 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-3600_PPC_Verify Reject Release Drops at Department/style level work well
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	#Pre-condition
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Clean Up
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Rejected Status
	And I click on the DropLocation
	And I click on DeleteDrop button
	And I am back to drops page

@BP-4520 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-4520_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when Drop Quantity is updated to non-zero value_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise WhatIf
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter UpdatedDropQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with UpdatedDropQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loads
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I capture TotalDropQuantityApproved
	And I compare TotalDropQuantityApproved with DropQuantity
	And I click on whatIfButton button
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with UpdatedDropQuantity
	And I click on the DropLocation
	And I wait till BuyPlan loads
	#CleanUp Steps
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I wait till BuyPlan loads
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4528 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-4528_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when Drop Quantity is updated to value zero_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise WhatIf
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with CleanUpQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I capture TotalDropQuantityApproved
	And I compare TotalDropQuantityApproved with DropQuantity
	And I click on whatIfButton button
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with CleanUpQuantity
	#CleanUp Steps
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button
	
@BP-4529 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-4529_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when one of the Order Quantity is updated to non-zero value_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	#And I click on NewZealandTab link
	#And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise WhatIf
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter UpdatedAUSOrderQuantity into QuantityAusTextField text field
	And I wait till BuyPlan loads
	And I click on DropEditSaveChanges button
	#And I click on NewZealandTab link
	#And I enter NZLOrderQuantity into  NewZealandQuantityTextField text input field
	#And I enter NZLOrderQuantity into NewZealandQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with UpdatedDropQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I capture TotalDropQuantityApproved
	And I compare TotalDropQuantityApproved with DropQuantity
	And I click on whatIfButton button
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with UpdatedDropQuantity
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I wait till BuyPlan loads
	#CleanUp Steps
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4530 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-4530_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when One of the Order Quantity is updated to value zero_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	#Pre-condition
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise WhatIf - Update the total drop quantity to Zero- Takes cae of cleanup
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	#And I enter CleanUpQuantity into QuantityAusTextField text field
	And I click on NewZealandTab link
	And I enter NZLOrderQuantity into NewZealandQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with NZLOrderQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I capture TotalDropQuantityApproved
	And I compare TotalDropQuantityApproved with DropQuantity
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I scroll down the page
	And I capture WhatIfTotalDropQuantityApproved
	And I compare WhatIfTotalDropQuantityApproved with NZLOrderQuantity
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I wait till BuyPlan loads
	#CleanUp Steps
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4531 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-4531_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when DC due date of one of the Order is changed_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Planner What If
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I scroll down the page
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I select NextAvailableDcDuedate from OrderDcDueDate dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on approved drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Verify that DC due date is not updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in Approved Status
	And I capture TotalOldApprovedDropQuantity
	And I compare TotalOldApprovedDropQuantity with DropQuantity
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I scroll down the page
	#CleanUp
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I wait till BuyPlan loads
	And I click on the OldDropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4533 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha @ModifiedBy_Shwetha
Scenario: BP-4533_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when DC due date of a Drop is changed_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Planner What If
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I select NextAvailableDcDuedate from DropDcDueDate dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Rejection for Planner Whatif on approved drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Verify that DC due date is not updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in Approved Status
	And I capture TotalOldApprovedDropQuantity
	And I compare TotalOldDropQuantity with DropQuantity
	And I wait till BuyPlan loads
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4534 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Niharika @ModifiedBy_Shwetha
Scenario: BP-4534_PPC_Verify Planner proposed change(What-if) when one of the split(order) quantity is updated to zero value for PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I wait till BuyPlan loads
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf - update Austerlia quantity to Zero
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I click on NewZealandTab link
	And I enter NZLOrderQuantity into NewZealandQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS approve planner proposed changes
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon checkBox
	And I click on ApproveSelectionButton button
	And I wait for "200000" milliseconds
	#Validation
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	And I verify TotalDropQuantity textfield contains NZLOrderQuantity
	And I click on the DropLocation
	And I verify that AustraliaTab is not Present
	#Clean Up
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4535 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Niharika @ModifiedBy_Shwetha
Scenario: BP-4535_PPC_Edit Mode_Verify the Planner proposed Change through WhatIf in edit mode when drop quantity is updated to any non-zero value for PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I wait till BuyPlan loads
	And I capture DropQuantity in DropQuantity
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Update Drop quantity using What-if and Edit mode
	And I click on EditMode button
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I scroll down the page
	And I click on EditRow button
	And I enter UpdatedDropQuantity into  EditModeDropQuantityField text input field
	And I click on SubmitIcon link
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS approve planner proposed changes
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHlf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon checkBox
	And I click on ApproveSelectionButton button
	And I wait for "200000" milliseconds
	#Validation
	And I navigate to Drops page as Planner
	And I click on PlannerSelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	And I verify TotalDropQuantity textfield contains UpdatedDropQuantity
	#Clean Up
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on the DropLocation
	And I am on the DropEdit page
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4539 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Niharika
Scenario: BP-4539_PPC_Edit Mode_Verify the Planner proposed Change through WhatIf in edit mode when drop quantity is updated to value zero for PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I capture DropQuantity in DropQuantity
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "60000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Update Drop quantity using What-if and Edit mode
	And I click on EditMode button
	And I click on whatIfButton button
	And I click on EditRow button
	And I enter UpdatedDropQuantity into  EditModeDropQuantityField text input field
	And I click on SubmitIcon link
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS approve planner proposed changes
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon checkBox
	And I click on ApproveSelectionButton button
	And I wait for "120000" milliseconds
	#Validation
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that drop got deleted
	

@BP-4540 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Niharika @ModifiedBy_Shwetha
Scenario: BP-4540_PPC_Edit Mode_Verify the Planner proposed Change through WhatIf in edit mode when drop quantity is updated to any non-zero value for Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	#Release the drop
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Update Drop quantity using What-if and Edit mode
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I scroll down the page
	And I click on EditMode button
	And I click on EditRow button
	And I wait till BuyPlan loads
	And I scroll down the page
	And I enter UpdatedDropQuantity into  EditModeDropQuantityField text input field
	And I click on SubmitIcon link
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS approve planner proposed changes
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon checkBox
	And I click on ApproveSelectionButton button
	#And I wait for "120000" milliseconds
	#Validation
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	#Cleanup
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I scroll down the page
	And I click on the DropLocation
	And I wait till BuyPlan loads
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4541 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Niharika
Scenario: BP-4541_PPC_Edit Mode_Verify the Planner proposed Change through WhatIf in edit mode when drop quantity is updated to value zero for Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on PackProfile_AUS link
	And I click on NewZealandTab link
	And I click on PackProfile_NZL link
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I wait till BuyPlan loads
	And I click on TestChinaShanghaiFactory link
	And I verify that ApproveSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Update Drop quantity using What-if and Edit mode
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on EditMode button
	And I click on EditRow button
	And I scroll down the page
	And I wait till BuyPlan loads
	And I enter UpdatedDropQuantity into  EditModeDropQuantityField text input field
	And I click on SubmitIcon link
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS approve planner proposed changes
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on PlannerProposedChange tab
	And I wait till BuyPlan loads
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon checkBox
	And I click on ApproveSelectionButton button
	#And I wait for "120000" milliseconds
	#Validation
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that drop got deleted

@BP-4552 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Niharika
Scenario: BP-4552_PPC_Verify Planner proposed change(What-if) when new Order AUS is added to PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	#Add and assign pack to Drop
	And I click on ManagePackButton button
	And I enter TestPackName into PackNameTextField text field
	And I enter RatioPackSize into RatioPackSize8 text field
	And I enter RatioPackSize into RatioPackSize10 text field
	And I click on ManagePackSave button
	And I verify that newlyAddedPack is Present
	And I click on BackToDrop button
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	#Release drop
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I click on productLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf - ADD new Order AUS to PO Drop
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I click on addOrderPlusIcon link
	And I click on AusOrder button
	And I click on newlyAddedOrder tab
	And I verify that NewOrderAUSTabQuantity is Present
	And I enter NewOrderQuantity into NewOrderAUSTabQuantity text field
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS approve planner proposed changes
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on PPC_PageProduct checkBox
	And I click on ApproveSelectionButton button
	And I wait for "120000" milliseconds
	#Validation
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that UpdatedDrop is in Approved Status
	And I verify DropPageQuantity textfield contains TotalDropQuantity
	#Raise Purchase Order For approved Planner proposed changes AUS Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	And I verify DropPageQuantity textfield contains TotalDropQuantity


@BP-4584 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Niharika
Scenario: BP-4584_PPC_Verify Planner proposed change(What-if) when new Order NZ is added to Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	#Add and assign pack to Drop
	And I click on ManagePackButton button
	And I enter TestPackName into PackNameTextField text field
	And I enter RatioPackSize into RatioPackSize8 text field
	And I enter RatioPackSize into RatioPackSize10 text field
	And I click on ManagePackSave button
	And I verify that newlyAddedPack is Present
	And I click on BackToDrop button
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	#Release drop
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#Approval from KAS user
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I click on productLevel checkBox
	And I click on ApproveSelection button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	#Raise WhatIf - ADD new Order AUS to PO Drop
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I click on addOrderPlusIcon link
	And I click on NZLOrder button
	And I click on newlyAddedOrder tab
	And I verify that NewOrderNZLTabQuantity is Present
	And I enter NewOrderQuantity into NewOrderNZLTabQuantity text field
	And I click on TestPack of the TestPackName
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I wait till BuyPlan loads
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS approve planner proposed changes
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on PPC_PageProduct checkBox
	And I click on ApproveSelectionButton button
	And I wait for "120000" milliseconds
	#Validation
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that UpdatedDrop is in Approved Status
	And I verify DropPageQuantity textfield contains TotalDropQuantity
	#Raise Purchase Order all the approved quantities
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	And I verify DropPageQuantity textfield contains TotalDropQuantity

@BP-4542 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4542_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when Drop Quantity is updated to non-zero value_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter UpdatedDropQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with UpdatedDropQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I capture TotalDropQuantityPO
	And I compare TotalDropQuantityPO with DropQuantity
	And I click on whatIfButton button	
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with UpdatedDropQuantity
	And I click on the DropLocation
	#CleanUp Steps
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4548 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4548_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when Drop Quantity is updated to value zero_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with CleanUpQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	And I capture TotalDropQuantityPO
	And I compare TotalDropQuantityPO with DropQuantity
	And I click on whatIfButton button
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with CleanUpQuantity
	#CleanUp Steps
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4553 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4553_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when one of the Order Quantity is updated to non-zero value_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter UpdatedAUSOrderQuantity into QuantityAusTextField text field
	And I click on NewZealandTab link
	And I enter NZLOrderQuantity into NewZealandQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with UpdatedDropQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	And I capture TotalDropQuantityPO
	And I compare TotalDropQuantityPO with DropQuantity
	And I click on whatIfButton button
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with UpdatedDropQuantity
	And I click on the DropLocation
	#CleanUp Steps
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4554 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4554_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when One of the Order Quantity is updated to value zero_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Raise WhatIf - Update the total drop quantity to Zero- Takes cae of cleanup
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter CleanUpQuantity into QuantityAusTextField text field
	And I click on NewZealandTab link
	And I enter NZLOrderQuantity into NewZealandQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with NZLOrderQuantity
	#KAS Rejection
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Back to Drops page and verify the rejected Drop
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I capture TotalDropQuantityPO
	And I compare TotalDropQuantityPO with DropQuantity
	And I click on whatIfButton button
	And I capture WhatIfTotalDropQuantityPO
	And I compare WhatIfTotalDropQuantityPO with NZLOrderQuantity
	And I click on the DropLocation
	#CleanUp Steps
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button

@BP-4555 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4555_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when DC due date of one of the Order is changed_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Planner What If
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I select NextAvailableDcDuedate from OrderDcDueDate dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on PO drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Verify that DC due date is not updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in PurchasedOrder Status
	And I capture TotalOldPODropQuantity
	And I compare TotalOldPODropQuantity with DropQuantity
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on the OldDropLocation
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4556 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4556_PPC_Verify whether KAS user is able to Reject Planner Proposed Changes when DC due date of a Drop is changed_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Planner What If
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I select NextAvailableDcDuedate from DropDcDueDate dropdown
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on PO drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on RejectSelectionButton button
	And I click on KasRejectSelectionCommentSaveButton button
	#Verify that DC due date is not updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in Purchased Order Status
	And I capture TotalOldPODropQuantity
	And I compare TotalOldPODropQuantity with DropQuantity
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4586 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4586_PPC_Verify the Planner proposed Change through Multiselect WhatIf mode when DC due date of the Drop is updated_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Planner What If
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on whatIfButton button
	And I scroll down the page
	And I click on MultiSelectButton button
	And I click on the DropLocation
	And I click on MultiSelectMove button
	And I click on NextAvailableDcDuedate link
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on PO drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelectionButton button
	#Verify that DC due date is updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Approved Status
	And I capture TotalDropQuantityApproved
	And I compare TotalDropQuantityApproved with DropQuantity
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	#CleanUp
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4599 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4599_PPC_Verify the Planner proposed Change through Multiselect WhatIf mode when DC due date of the Drop is updated_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	#Move the drop to Released state
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	#check whether DropsProductNumber webelement has same xpath
	And I enter ProductName into  DropsProductNumber text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsPageProductNumber text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	#Planner What If
	And I click on whatIfButton button
	And I scroll down the page
	And I click on MultiSelectButton button
	And I click on the DropLocation
	And I click on MultiSelectMove button
	And I click on NextAvailableDcDuedate link
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on PO drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelectionButton button
	#Verify that DC due date is updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status
	And I capture TotalDropQuantityApproved
	And I compare TotalDropQuantityApproved with DropQuantity
	And I click on whatIfButton button
	And I click on the DropLocation
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4607 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4607_Verify the Planner proposed Change through Multiselect mode when DC due date is updated_VerticalMove_Approved Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity1 into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I capture DataOidOfDrop1
	#Group Drop2 with different option
	And I click on SameDcDiffOptionZeroLoc link
	And I am on the CreateDrops page
	And I enter DropQuantity2 into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I capture DataOidOfDrop2
	And I verify ReleasedGroupOrders is in Released state
	#KAS Approval of Released Drops
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Navigate back to Drops Page
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify ApprovedGroupOrders is in Approved state
	#Planner Whatif : Change in DC due date at Drop level through Multiselect mode
	And I click on whatIfButton button
	And I scroll down the page
	And I click on MultiSelectButton button
	And I click on the ApprovedGroupOrders
	And I click on MultiSelectMove button
	And I click on NextAvailableGroupDcDuedate link
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on PO drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelectionButton button
	#Verify that DC due date is updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify UpdatedApprovedGroupOrders is in Approved state
	#CleanUp
	And I click on whatIfButton button
	And I click on the ApprovedGroupOrder1
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on the ApprovedGroupOrder2
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@BP-4609 @PlannerProposedChanges @AWS_NonProd @CreatedBy_Shwetha
Scenario: BP-4609_Verify the Planner proposed Change through Multiselect mode when DC due date is updated_VerticalMove_PO Drop
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity1 into quantityInputField text field
	And I enter  into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I capture DataOidOfDrop1
	#Group Drop2 with different option
	And I click on SameDcDiffOptionZeroLoc link
	And I am on the CreateDrops page
	And I enter DropQuantity2 into quantityInputField text field
	And I enter SplitPercentage into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropEditSaveChanges button
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I capture DataOidOfDrop2
	And I verify ReleasedGroupOrders is in Released state
	#KAS Approval of Released Drops
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on DepartmentLevel checkBox
	And I click on ApproveSelection button
	#Raise Purchase order
	And I navigate to PurchaseOrder page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  POProductNumberSearchText text input field
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "120000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify POGroupOrders is in Purchased Order state
	#Planner Whatif : Change in DC due date at Drop level through Multiselect mode
	And I click on whatIfButton button
	And I scroll down the page
	And I click on MultiSelectButton button
	And I click on the POGroupOrders
	And I click on MultiSelectMove button
	And I click on NextAvailableGroupDcDuedate link
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	#KAS Approval for Planner Whatif on PO drop
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelectionButton button
	#Verify that DC due date is updated
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify UpdatedPOGroupOrders is in Purchased Order state
	#CleanUp
	And I click on whatIfButton button
	And I click on the POGroupOrder1
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on the POGroupOrder2
	And I am on the DropEdit page
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaCheckBoxIcon button
	And I click on ApproveSelectionButton button

@PlannerProposedChanges @AWS_NonProd @CreatedBy_Ramya @ModifiedBy_Ramya
Scenario:BP-4765_PPC_HorizontalMove_Verify the Planner proposed Change through Multiselect WhatIf mode when DC due date of the Drop is updated_Approved Drop
	
	# creating two approved drops


	#Create first drop at some option and releasing it
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter SplitPercentage into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	And I capture DCDueDateOfDrop

	#create the second drop at same option level selected before and releasing it
	And I click on the ZeroDropAtSameOption
	And I am on the CreateDrops page
	And I enter DropQuantity2 into quantityInputField text field
	And I enter SplitPercentage2 into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status

	#Approving both the drops released in Kas view

	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on SelectHalf link
	And I click on KasPendingApproval button
	And I click on KishaniTestFactory link
	And I click on ProductCheckbox of the ProductName
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button
	
	#navigating to planner view and submitting the what if, horizontal move for the just approved two drops

	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on MultiSelectButton button
	And I wait till BuyPlan loads
	And I click on the OldDropLocation
	And I click on the DropLocation
	And I click on MultiSelectMove button
	And I select WeeksForHorizontalMove from dropdown
	And I capture DCDueDatesAfterMove
	And I click on MultiSelectReflowButton button
	And I capture DropQunatitiesAfterMove
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button


	#navigating to the kas view and approving the horizontal move what if submitted

	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaShanghaiFactory link
	And I click on ApproveSelectionButton button
	
	#navigating back to planner view and verifying the horizontally moved drops are present with correct status and quantity value
	
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in Approved Status
	And I verify that Drop is in Approved Status
	And I verify that FirstDropMoved is Present
	And I verify that SecondDropMoved is Present


	#Deleting the two drops created and moved 
	
	And I click on whatIfButton button
	And I click on the DropLocation
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on the OldDropLocation
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaShanghaiFactory link
	And I click on ApproveSelectionButton button


@PlannerProposedChanges @AWS_NonProd @CreatedBy_Ramya @ModifiedBy_Ramya
Scenario:BP-4766_PPC_HorizontalMove_Verify the Planner proposed Change through Multiselect WhatIf mode when DC due date of the Drop is updated_PO Drop
	
	# creating two PO drops

	#Create first drop at some option and releasing it
	Given I Login to BuyPlan Application as Planner
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on zeroDropQuantityLocation link
	And I am on the CreateDrops page
	And I enter DropQuantity into quantityInputField text field
	And I enter SplitPercentage into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status
	And I capture DCDueDateOfDrop

	#create the second drop at same option level selected before and releasing it
	And I click on the ZeroDropAtSameOption
	And I am on the CreateDrops page
	And I enter DropQuantity2 into quantityInputField text field
	And I enter SplitPercentage2 into newZealandSplitTextField text field
	And I click on SaveChanges button
	And I am on the DropEdit page
	And I click on DropStateReleased link
	And I click on UpdateStatus button
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I am back to drops page
	And I verify that Drop is in Released Status



	#Approving both the drops released in Kas view

	#KAS Approval
	And I navigate to FactoryCapacityPlanning page as KAS user
	#And I wait till BuyPlan loading is complete
	#And I click on SelectHalf link
	And I wait till BuyPlan loading is complete
	And I click on KasPendingApproval button
    And I wait till BuyPlan loads
	And I click on KishaniTestFactory link
	And I wait till BuyPlan loading is complete
	And I click on ProductCheckbox of the ProductName
	And I verify that ApproveSelectionButton is Present
	And I verify that RejectSelectionButton is Present
	And I click on ApproveSelection button
	And I wait till BuyPlan loading is complete
	
    #Raise the Purchase Order
	And I navigate to PurchaseOrder page as Planner
	And I wait till BuyPlan loading is complete
	And I click on SelectHalf link
	And I wait till BuyPlan loading is complete
	And I enter ProductName into  ProductNumberSearchTextPO text input field
	And I wait till BuyPlan loading is complete
	And I click on ReadyForPurchaseOrder checkBox
	And I verify that RaiseOrdersButton is Present
	And I click on RaiseOrdersButton button
	And I wait for "200000" milliseconds
	And I click on PurchaseOrderRaisedTab button
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that Drop is in Purchased Order Status

	#navigating to planner view and submitting the what if, horizontal move for the just approved two drops

	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I click on whatIfButton button
	And I wait till BuyPlan loads
	And I click on MultiSelectButton button
	And I wait till BuyPlan loads
	And I click on the OldDropLocation
	And I click on the DropLocation
	And I click on MultiSelectMove button
	And I select WeeksForHorizontalMove from dropdown
	And I capture DCDueDatesAfterMove
	And I click on MultiSelectReflowButton button
	And I capture DropQunatitiesAfterMove
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button


	#navigating to the kas view and approving the horizontal move what if submitted

	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaShanghaiFactory link
	And I click on ApproveSelectionButton button
	
	#navigating back to planner view and verifying the horizontally moved drops are present with correct status and quantity value
	
	And I navigate to Drops page as Planner
	And I click on SelectHalf link
	And I enter ProductName into  DropsProductNumberField text input field
	And I click on DropsSearch link
	And I scroll down the page
	And I verify that OldDrop is in Approved Status
	And I verify that Drop is in Approved Status
	And I verify that FirstDropMoved is Present
	And I verify that SecondDropMoved is Present


	#Deleting the two drops created and moved 
	
	And I click on whatIfButton button
	And I click on the DropLocation
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on the OldDropLocation
	And I enter CleanUpQuantity into DropQuantityTextField text field
	And I click on DropEditSaveChanges button
	And I click on DropEditClose button
	And I click on WhatIfSubmitIcon button
	And I select KmartOption from RequestedBy dropdown
	And I click on Submit button
	And I navigate to FactoryCapacityPlanning page as KAS user
	And I click on KASSelectHalf link
	And I click on PlannerProposedChange tab
	And I select DepartmentOption from PendingWhatIf dropdown
	And I click on TestChinaShanghaiFactory link
	And I click on ApproveSelectionButton button