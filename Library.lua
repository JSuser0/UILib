--< Services >--
local players = game:GetService("Players")

-- [ VARIABLES ] --
--< Client >--
local client = players.LocalPlayer

-- [ LIBRARY ] --
local uiClass = { };

-- [ LIBRARY ESSENTIALS ] --
--< Screen >--
function uiClass:CreateScreen()
	--< Creating >--
	local screen = Instance.new("ScreenGui")
	screen.Name = "Screen"
	screen.Parent = client.PlayerGui
	screen.IgnoreGuiInset = true
	screen.ResetOnSpawn = false
	
	--< Returning >--
	return screen
end

--< Frame Creation >--
function uiClass:CreateFrame(parent, size, position)
	--< Creating >--
	local frame = Instance.new("Frame")
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	frame.BorderSizePixel = 0

	--< Stroke >--
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(42, 42, 42)
	stroke.LineJoinMode = Enum.LineJoinMode.Bevel
	stroke.Thickness = 2.4
	stroke.Parent = frame
	
	--< Size Check >--
	if (size == nil) then
		frame.Size = UDim2.new(0.153, 0, 0.233, 0)
	else
		frame.Size = UDim2.new(table.unpack(size))
	end
	
	--< Position Check >--
	if (position == nil) then
		frame.Position = UDim2.new(0.426, 0, 0.453, 0)
	else
		frame.Position = UDim2.new(table.unpack(position))
	end
	
	--< Parent >--
	frame.Parent = parent
	
	--< Returning >--
	return frame
end

--< Description >--
function uiClass:CreateDescription(parent, text, sizeConst)
	--< Creation >--
	local description = Instance.new("TextLabel", parent)
	
	--< Description >--
	description.TextColor3 = Color3.fromRGB(188, 188, 188)
	description.Font = Enum.Font.SourceSansLight
	description.Position = UDim2.new(0, 0, 0, 0)
	description.TextStrokeTransparency = 0.44
	description.Size = UDim2.new(1, 0, 1, 0)
	description.BackgroundTransparency = 1
	description.TextScaled = true
	description.Text = text

	local sizeConstant = Instance.new("UITextSizeConstraint", description)
	sizeConstant.MaxTextSize = sizeConst
	
	--< Returning >--
	return description
end

--< Title >--
function uiClass:CreateTitle(parent, text, sizeConst)
	--< Creation >--
	local title = uiClass:CreateDescription(parent, text, sizeConst)
	title.Font = Enum.Font.SourceSansBold
	
	--< Returning >--
	return title
end

--< Scrolling Frame >--
function uiClass:CreateScrollingFrame(parent, size, position)
	--< Creation >--
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	scrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	scrollingFrame.ScrollBarThickness = 12
	scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(115, 115, 115)
	
	--< Stroke >--
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(42, 42, 42)
	stroke.LineJoinMode = Enum.LineJoinMode.Bevel
	stroke.Thickness = 2.4
	stroke.Parent = scrollingFrame

	--< Size Check >--
	if (size == nil) then
		scrollingFrame.Size = UDim2.new(0.153, 0, 0.233, 0)
	else
		scrollingFrame.Size = UDim2.new(table.unpack(size))
	end

	--< Position Check >--
	if (position == nil) then
		scrollingFrame.Position = UDim2.new(0.426, 0, 0.453, 0)
	else
		scrollingFrame.Position = UDim2.new(table.unpack(position))
	end
	
	--< Parent >--
	scrollingFrame.Parent = parent
	
	--< Returning >--
	return scrollingFrame
end

--< Button >--
function uiClass:CreateButton(parent, size, position, text)
	--< Creation >--
	local buttonFrame = uiClass:CreateFrame(parent)
	local button = Instance.new("TextButton", buttonFrame)
	
	--< Size Check >--
	if (size == nil) then
		buttonFrame.Size = UDim2.new(0.771, 0, 0.245, 0)
	else
		buttonFrame.Size = UDim2.new(table.unpack(size))
	end

	--< Position Check >--
	if (position == nil) then
		buttonFrame.Position = UDim2.new(0.426, 0, 0.453, 0)
	else
		buttonFrame.Position = UDim2.new(table.unpack(position))
	end
	
	--< Button >--
	button.Size = UDim2.new(1, 0, 1, 0)
	button.Position = UDim2.new(0, 0, 0, 0)
	buttonFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.BorderSizePixel = 0
	button.Text = ""
	
	--< Description >--
	local description = uiClass:CreateDescription(button, text, 14)
	
	--< Returning >--
	return buttonFrame, button
end


-- [ LIBRARY BUILT-IN UI ] --
--< Essential >--
function uiClass:Create(name)
	-- [ VARIABLES ] --
	--< Frames >--
	local screen = uiClass:CreateScreen()
	local base = uiClass:CreateFrame(screen, {0, 516, 0, 359}, {0.262, 0, 0.261, 0})
	local side = uiClass:CreateFrame(base, {0, 136, 0, 329}, {-0.001, 0, 0.082, 0})
	local top = uiClass:CreateFrame(base, {0, 516, 0, 30}, {-0.001, 0, -0.001, 0})
	
	--< Buttons >--
	local exitButton = uiClass:CreateButton(base, {0, 19, 0, 19}, {0.951, 0, 0.013, 0}, "")
	exitButton.BackgroundColor3 = Color3.fromRGB(212, 14, 34)
	exitButton.UIStroke.Color = Color3.fromRGB(136, 8, 25)
	exitButton.TextButton.BackgroundColor3 = Color3.fromRGB(212, 14, 34)
	
	--< Title >--
	local title = uiClass:CreateTitle(top, name, 12.5)
	title.Position = UDim2.new(0.016, 0, 0, 0)
	title.Size = UDim2.new(0.174, 0, 1, 0)
	
	--< Returning >--
	return screen
end

--< Tab >--
function uiClass:CreateTab(name)
	
end

return uiClass