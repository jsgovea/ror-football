import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-session"
export default class extends Controller {
  static targets = ['teams', 'league', 'childSelect', 'teamSelect']
  static values = {
    teamsJson: String
  }

  connect() {
    console.log('GameSessionController connected');
    this.updateChildSelect()
  }

  updateChildSelect() {
    const teamsData = this.data.get("teams");
    this.teamsJson = JSON.parse(teamsData)
  }

  changeLeague(e) {
    let leagueSelected = e.target.options[e.target.selectedIndex].value
    const filteredTeams = this.teamsJson.filter((team) => team['league_id'] === parseInt(leagueSelected, 10));
    this.updateDropdown(filteredTeams)
  }

  updateDropdown(data) {
    this.teamSelectTarget.innerHTML = ""
    data.forEach((team) => {
      const option = document.createElement('option')
      option.value = team.id
      option.innerHTML = team.name
      this.teamSelectTarget.appendChild(option)
    })
  }
}
