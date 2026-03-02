return {
    "salorak/orak.nvim",
    lazy = false,
    config = function()
        --- Setup note
        local Note = require("orak.note")

        local opts = {
            path = "~/personal/notes/zk",
        }

        Note.setup(opts)

        -- Setup organize
        local Organize = require'orak.organize'

        local Template = require'orak.common.template'

        local capture = Template.new({enclose = "-", eq = ":"})
                        :withBody("# Capture")

        local projects = Template.new({enclose = "-", eq = ":"})
                        :withBody("# Projects Organization")

        local yearly = Template.new({enclose = "-", eq = ":"})
                        :withHeader("creation-date", "{date:%d-%m-%Y}")
                        :withBody("# 🦕 Year {year}")
                        :withBody("")
                        :withBody("## 🐬 Goals")
                        :withBody("")
                        :withBody("Brief description of the goals")
                        :withBody("- [ ]  Goal 1 ")
                        :withBody("- [ ]  Goal 2 ")
                        :withBody("")
                        :withBody("## 🦖 Review")
                        :withBody("")
                        :withBody("Brief description of the year in retrospective")
                        :withBody("")
                        :withBody("🐦 Goals Accomplished")
                        :withBody("- [X] Goal 1")
                        :withBody("")
                        :withBody("📖 Books Read")
                        :withBody("| Book| Author |")
                        :withBody("|-|")
                        :withBody("| | |")
                        :withBody("")
                        :withBody("## 📖 Books List")
                        :withBody("| Book| Author | Read|")
                        :withBody("|-|")
                        :withBody("| | | |")
                        :withBody("")

        local monthly = Template.new({enclose = "-", eq = ":"})
                        :withHeader("creation-date", "{date:%d-%m-%Y}")
                        :withBody("# 🐉 {month}")
                        :withBody("")
                        :withBody("## 🐦 Objectives")
                        :withBody("- [ ]  Objective 1 - Aligned YG-1 ")
                        :withBody("- [ ]  Objective 2 - Aligned YG-1 ")
                        :withBody("")
                        :withBody("## 🫧 Monthly clean up")
                        :withBody("- [ ]  Desktop uncluttering")
                        :withBody("- [ ]  Fridge cleaning ")
                        :withBody("- [ ]  Notebook organization")
                        :withBody("- [ ]  Pen refill 💴 ")
                        :withBody("")
                        :withBody("## 📖 Reading Books ")
                        :withBody("- [ ] Book One: Author One")
                        :withBody("")
                        :withBody("## 🦚 Review")
                        :withBody("Brief description of the month in retrospective")
                        :withBody("")

        local weekly = Template.new({enclose = "-", eq = ":"})
                        :withHeader("creation-date", "{date:%d-%m-%Y}")
                        :withBody("# 🐍 Week {week} ")
                        :withBody("Brief Week's purpose. ")
                        :withBody("")
                        :withBody("## 🐤 Tasks")
                        :withBody("- [ ]  Task 1 - Aligned MG-1 ")
                        :withBody("- [ ]  Task 2 - Aligned MG-1 ")
                        :withBody("")
                        :withBody("## 📖 Reading Books ")
                        :withBody("- [ ] Book One: Author One")
                        :withBody("")
                        :withBody("## 🗓️ Social events ")
                        :withBody("| Day | Education | Chore | Work | Social |")
                        :withBody("|-|")
                        :withBody("| Monday | | | | |")
                        :withBody("| Tuesday| | | | |")
                        :withBody("| Wednesday | | | | |")
                        :withBody("| Thursday| | | | |")
                        :withBody("| Friday | | | | |")
                        :withBody("| Saturday| | | | |")
                        :withBody("| Sunday| | | | |")
                        :withBody("")
                        :withBody("## 🦚 Review")
                        :withBody("Brief description of the week in retrospective")
                        :withBody("")
        local set = {
            yearly = yearly,
            monthly = monthly,
            weekly = weekly,
			inbox = capture,
			projects = projects
        }

        local opts = {
            path = "~/personal/notes/organize", -- Directory's path to store files.
			inbox = "Capture.md", -- Inbox filename
            template = {
                set = set,
                opts = {
                    substitution = {
                        week = function(obj, _)
                            local week_number = Organize.get_week_number()
                            return string.format("%s", week_number)
                        end,
                        month = function(obj, _)
                            local month = os.date('%B') 
                            month = month:gsub("^%l", string.upper)
                            return string.format("%s", month)
                        end,
                        year = function(obj, _)
                            local year = os.date('%Y') 
                            return string.format("%s", year)
                        end,
                    }
                }
            }
        }

        Organize.setup(opts)

        -- Setup terminal
        local Terminal = require'orak.terminal'
		Terminal.setup({})
    end,
}
