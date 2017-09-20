export class Minion {
  id:     number
  name:   string
  avatar: string
  
  constructor(map: any) {
    this.id     = map['id']
    this.name   = map['name']
    this.avatar = map['avatar']
  } 
}

export class Creds {
  castle: string
  minion: string
  
  constructor(castle: string, minion: string) {
    this.castle = castle
    this.minion = minion
  }
  
  valid(): boolean {
    return this.castle != '' && this.minion != ''
  }
}