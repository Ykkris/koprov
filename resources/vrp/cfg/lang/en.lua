
-- define all language properties

local lang = {
  common = {
    no_player_near = "~r~No player near you.",
    invalid_value = "~r~Invalid value.",
    invalid_name = "~r~Invalid name."
  },
  survival = {
    starving = "starving",
    thirsty = "thirsty"
  },
  money = {
    given = "Given ~r~{1}$.",
    received = "Received ~g~{1}$.",
    not_enough = "~r~Not enough money.",
    paid = "Paid ~r~{1}$.",
    give = {
      title = "Give money",
      description = "Give money to the nearest player.",
      prompt = "Amount to give:"
    }
  },
  inventory = {
    title = "Inventory",
    description = "Open the inventory.",
    iteminfo = "({1})<br /><br />{2}",
    give = {
      title = "Give",
      description = "Give items to the nearest player.",
      prompt = "Amount to give (max {1}):",
      given = "Given ~r~{1} ~s~{2}.",
      received = "Received ~g~{1} ~s~{2}.",
    }
  },
  atm = {
    title = "ATM",
    info = {
      title = "Info",
      bank = "bank: {1} $"
    },
    deposit = {
      title = "Deposit",
      description = "wallet to bank",
      prompt = "Enter amount of money for deposit:",
      deposited = "~r~{1}$~s~ deposited."
    },
    withdraw = {
      title = "Withdraw",
      description = "bank to wallet",
      prompt = "Enter amount of money to withdraw:",
      withdrawn = "~g~{1}$ ~s~withdrawn.",
      not_enough = "~r~You don't have enough money in bank."
    }
  },
  business = {
    title = "Chamber of Commerce",
    directory = {
      title = "Directory",
      description = "Business directory.",
      dprev = "> Prev",
      dnext = "> Next",
      info = "<em>capital: </em>{1} $<br /><em>owner: </em>{2} {3}<br /><em>registration n°: </em>{4}<br /><em>phone: </em>{5}"
    },
    info = {
      title = "Business info",
      info = "<em>name: </em>{1}<br /><em>capital: </em>{2} $<br /><em>capital transfer: </em>{3} $<br /><br/>Capital transfer is the amount of money transfered for a business economic period, the maximum is the business capital."
    },
    addcapital = {
      title = "Add capital",
      description = "Add capital to your business.",
      prompt = "Amount to add to the business capital:",
      added = "~r~{1}$ ~s~added to the business capital."
    },
    launder = {
      title = "Money laundering",
      description = "Use your business to launder dirty money.",
      prompt = "Amount of dirty money to launder (max {1} $): ",
      laundered = "~g~{1}$ ~s~laundered.",
      not_enough = "~r~Not enough dirty money."
    },
    open = {
      title = "Open business",
      description = "Open your business, minimum capital is {1} $.",
      prompt_name = "Business name (can't change after, max {1} chars):",
      prompt_capital = "Initial capital (min {1})",
      created = "~g~Business created."
      
    }
  },
  cityhall = {
    title = "City Hall",
    identity = {
      title = "New identity",
      description = "Create a new identity, cost = {1} $.",
      prompt_firstname = "Enter your firstname:",
      prompt_name = "Enter your name:",
      prompt_age = "Enter your age:",
    },
    menu = {
      title = "Identity",
      info = "<em>Name: </em>{1}<br /><em>First name: </em>{2}<br /><em>Age: </em>{3}<br /><em>Registration n°: </em>{4}<br /><em>Phone: </em>{5}"
    }
  },
  phone = {
    title = "Phone",
    directory = {
      title = "Directory",
      description = "Open the phone directory.",
      add = {
        title = "> Add",
        prompt_number = "Enter the phone number to add:",
        prompt_name = "Enter the entry name:",
        added = "~g~Entry added."
      },
      sendsms = {
        title = "Send SMS",
        prompt = "Enter the message (max {1} chars):",
        sent = "~g~ Sent to n°{1}.",
        not_sent = "~r~ n°{1} unavailable."
      },
      sendpos = {
        title = "Send position",
      },
      remove = {
        title = "Remove"
      }
    },
    sms = {
      title = "SMS History",
      description = "Received SMS history.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Position ~b~ {1}"
    },
    service = {
      title = "Service",
      description = "Call a service or an emergency number."
    }
  },
  emotes = {
    title = "Emotes",
    clear = {
      title = "> Clear",
      description = "Clear all running emotes."
    }
  },
  garage = {
    title = "Garage ({1})",
    owned = {
      title = "Owned",
      description = "Owned vehicles."
    },
    buy = {
      title = "Buy",
      description = "Buy vehicles.",
      info = "{1} $<br /><br />{2}"
    },
    store = {
      title = "Store",
      description = "Put your current vehicle in the garage."
    }
  },
  gunshop = {
    title = "Gunshop ({1})",
    prompt_ammo = "Amount of ammo to buy for the {1}:",
    info = "<em>body: </em> {1} $<br /><em>ammo: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "Market ({1})",
    prompt = "Amount of {1} to buy:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "Skinshop"
  }
}

return lang
