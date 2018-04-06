local PATH = (...):gsub('%.init$', '')

local Concord = {}

--- Initializes the library with some optional settings
-- @param settings Table of settings: {
--  useEvents Flag to overwrite love.run and use events. Defaults to false
-- }
-- @return Concord
function Concord.init(settings)
   Concord.entity       = require(PATH..".entity")
   Concord.component    = require(PATH..".component")
   Concord.system       = require(PATH..".system")
   Concord.instance     = require(PATH..".instance")

   if settings and settings.useEvents then
      Concord.instances = {}

      Concord.addInstance = function(instance)
         table.insert(Concord.instances, instance)
      end

      Concord.removeInstance = function(instance)
         for i, instance in ipairs(Concord.instances) do
            table.remove(Concord.instances, i)
            break
         end
      end

      love.run = require(PATH..".run")
   end

   return Concord
end

return Concord
