import { Component, Input } from '@angular/core'
import { Minion } from '../shared/minion'
import { Castle } from '../shared/castle'
import { ChannelService } from '../channel.service'

@Component({
  selector: 'app-minion',
  templateUrl: 'minion.component.html',
  styleUrls: ['minion.component.css']
})
export class MinionComponent {
  @Input()
  minion: Minion
  @Input()
  castle: Castle

  selected: boolean
  glossary: any

  constructor(private svc: ChannelService) {
    this.glossary = {
      cb: "Castle Black",
      rk: "Red Keep",
      ds: "DragonStone",
      b: "Baretheon",
    }
  }

  toggleVisible(flag: boolean) {
    this.selected = flag
  }

  sendMissive(text: string) {
    const tokens = text.split("|")
    const payload = {
      from: this.minion.name,
      body: tokens[1],
      at: Date.now()
    }
    this.svc.push(this.glossary[tokens[0]], payload)
  }
}