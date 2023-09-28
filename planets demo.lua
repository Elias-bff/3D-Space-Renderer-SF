--@name Planets demo
--@author Elias
--@include libs/3D_Space_renderer.lua
--@client

require("libs/3D_Space_renderer.lua")

local rotate=0

local mercury = holograms.create(chip():getPos(), Angle(90,-90,0), "models/sprops/misc/axis_plane.mdl",Vector(0))
mercury:setParent(chip())
local venus = holograms.create(chip():getPos(), Angle(90,-90,0), "models/sprops/misc/axis_plane.mdl",Vector(0))
venus:setParent(chip())
local earth = holograms.create(chip():getPos(), Angle(90,-90,0), "models/sprops/misc/axis_plane.mdl",Vector(0))
earth:setParent(chip())
local mars = holograms.create(chip():getPos(), Angle(90,-90,0), "models/sprops/misc/axis_plane.mdl",Vector(0))
mars:setParent(chip())
local jupiter = holograms.create(chip():getPos(), Angle(90,-90,0), "models/sprops/misc/axis_plane.mdl",Vector(0))
jupiter:setParent(chip())
local saturn = holograms.create(chip():getPos(), Angle(90,-90,0), "models/sprops/misc/axis_plane.mdl",Vector(0))
saturn:setParent(chip())

local moon = holograms.create(chip():getPos()+earth:getForward()*7, Angle(90,-90,0), "models/sprops/misc/axis_plane.mdl",Vector(0))
moon:setParent(earth)

hook.add("think","",function()
    rotate=rotate+0.1
    
    mercury:setAngles(Angle(0,rotate*4,0))
    venus:setAngles(Angle(0,rotate*1.6,0))
    earth:setAngles(Angle(0,rotate,0))
    mars:setAngles(Angle(0,rotate/2,0))
    jupiter:setAngles(Angle(0,rotate*0.08,0))
    saturn:setAngles(Angle(0,rotate*0.03,0))
    
    moon:setAngles(Angle(rotate*0.07,0,0))
end)

function ring(color,parent,radius,Ang)
    for i=0, 35 do
        render.setColor(color)
        
        local a=Vector(radius,0,0)
        local a2=Vector(radius,0,0)
        
        a:rotate(Angle(i*360/35)*Ang)
        a2:rotate(Angle((i+1)*360/35)*Ang)
        
        render.draw3DBeam(parent:getPos()+a,parent:getPos()+a2,0.08,1,1)
    end
end

local space=renderer:new(chip():getPos(),"3d",10,chip(),true)

space.renderhook=function()
    ring(Color(255,155,112),chip(),3,Angle(0,1,0))
    ring(Color(255,155,112),chip(),4.5,Angle(0,1,0))
    ring(Color(255,155,112),chip(),7,Angle(0,1,0))
    ring(Color(255,155,112),chip(),10,Angle(0,1,0))
    ring(Color(255,155,112),chip(),14,Angle(0,1,0))
    ring(Color(255,155,112),chip(),19,Angle(0,1,0))
    ring(Color(210,210,210),moon,1.5,Angle(1,0,0))
           
    render.setColor(Color(210,110,60))
    render.draw3DSphere(chip():getPos(),2,50,50)
    
    render.setColor(Color(236,198,134))
    render.draw3DSphere(chip():getPos()+mercury:getForward()*3,0.25,50,50)
    
    render.setColor(Color(217,163,73))
    render.draw3DSphere(chip():getPos()+venus:getForward()*4.5,0.55,50,50)
    
    render.setColor(Color(53,132,138))
    render.draw3DSphere(chip():getPos()+earth:getForward()*7,0.55,50,50)
    
    render.setColor(Color(250,250,250))
    render.draw3DSphere(moon:getPos()+moon:getForward()*1.5,0.2,50,50)
    
    render.setColor(Color(180,47,41))
    render.draw3DSphere(chip():getPos()+mars:getForward()*10,0.25,50,50)
    
    render.setColor(Color(225,172,139))
    render.draw3DSphere(chip():getPos()+jupiter:getForward()*14,1,50,50)
    
    render.setColor(Color(248,220,173))
    render.draw3DSphere(chip():getPos()+saturn:getForward()*19,0.85,50,50)
    
    render.popViewMatrix()
    
    local offset=chip():getPos()-Vector(0,0,0.5)
    local mer=space:toScreen(offset+mercury:getForward()*2)
    local ven=space:toScreen(offset+venus:getForward()*3)
    local ear=space:toScreen(offset+earth:getForward()*4.4)
    local mar=space:toScreen(offset+mars:getForward()*6.3)
    local jup=space:toScreen(offset+jupiter:getForward()*8.2)
    local sat=space:toScreen(offset+saturn:getForward()*11)
    
    render.drawText(mer.x,mer.y,"Mercury",1)
    render.drawText(ven.x,ven.y,"Venus  ",1)
    render.drawText(ear.x,ear.y,"Earth  ",1)
    render.drawText(mar.x,mar.y,"Mars   ",1)
    render.drawText(jup.x,jup.y,"Jupiter",1)
    render.drawText(sat.x,sat.y,"Saturn ",1)
end