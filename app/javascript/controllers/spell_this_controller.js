import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spell-this"
export default class extends Controller {
  static targets = ['spellword', 'timer', 'level', 'wordcount']

  library = [
    ["I", "hi", "you", "then", "at", "it", "eat","oh", "for", "tot"],
    ["thus", "then", "art", "truck", "cane", "fog", "glad", "gum", "plain", "prod"],
    ["plane", "fluke", "freed", "cupboard", "thorough", "extent", "content", "crisis", "grape", "tickled"],
    ["house","tractor","event", "unusually", "hydration", "electronically", "example", "omelette","extra", "glass"],
    ["loveable", "terrified", "fraction", "reversed", "faction", "reverbe", "dynamo", "kangaroo", "extracted", "addressed"],
    ["mitigated", "irreversible", "constipated", "descended", "interpreted", "developped", "fantasised", "irradicated", "inexplicable", "calamity"],
    ["bewilderment", "telescopic", "extrapolation", "consequential", "rhetorically", "gravitational", "prehistorical", "establishment", "ravanously", "distinguishment"],
    ["apoptosis", "dodecahedron", "excacerbated", "haphazardly", "enthusiastically", "disappointedly", "unmistakably", "ostentatiously", "commonsensical", "knowledgeable"]
  ]

  connect() {
    console.log('spell this')
    console.log(this.spellwordTarget.innerText);
    this.countDown()
    this.setNewWord(0)
    console.log(this.levelTarget.innerText);
    console.log(this.wordcountTarget.innerText);
  }

  countDown(){
    this.timerTarget.innerText = 999;
    let interval = setInterval(() => {
      if(this.timerTarget.innerText>0) {
        this.timerTarget.innerText--
      }else{
        this.stopGame()
        clearInterval(interval)
      }
    }, 1);
  }

  setNewWord(level){
    this.spellwordTarget.innerText = this.library[level][this.randomNumber(8)]
  }

  randomNumber(max){
    return Math.floor(Math.random() * max);
  }

  stopGame(){
    this.spellwordTarget.innerHTML = "looser looser looser <br/> ------ <br/> Spell this : <br/> YOU LOOSE <br/> ------ <br/> looser looser looser"
  }
}
