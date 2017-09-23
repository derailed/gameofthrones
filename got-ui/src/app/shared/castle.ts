import { Minion } from './minion'

export class Castle {
  name:        string
  description: string
  minions:     Minion[]  
  
  constructor(json:JSON) {
    this.name = json['name']
    this.description = json['description']
  }  
  
  badgeName() :string {
    return this.name.toLowerCase().replace(" ", "")
  }
}
