# SingKhmerKeyboard 🇰🇭

A phonetic Khmer keyboard for macOS (and Windows). You type romanized Khmer and it gives you Khmer script — like how Pinyin works for Chinese.

`nhom` → **ខ្ញុំ** · `suosdey` → **សួស្តី** · `arkun` → **អរគុណ**

---

## How it works

You type Khmer the way you'd text a friend in English. The keyboard figures out what you mean and shows Khmer script candidates.

- Multiple spellings work — `nhom`, `knyom`, `khnom` all give you ខ្ញុំ
- Fuzzy matching is on — misspell a little and it still finds the right word
- Phrases too — type `nhomtov` and get ខ្ញុំទៅ in one shot
- It learns — the more you type, the better it gets at guessing what you want

There are 40k+ entries out of the box covering consonants, common words, and everyday phrases.

---

## Install

**Step 1:** Install Homebrew (skip if you already have it)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Step 2:** Install Squirrel (the keyboard engine)
```bash
brew install --cask squirrel
```

**Step 3:** Install SingKhmer
```bash
brew tap HengHuyLong/singkhmer
brew install singkhmer
```

One manual step after that — add the keyboard in System Settings:

> **System Settings → Keyboard → Input Sources → Edit → `+` → Chinese, Simplified → Squirrel → Add**

Switch with `Ctrl + Space` and you're good to go.

Ps* i know it kinda sucks to be under chinese. sadge

---

## What you can type

### Everyday stuff

| Type | Get | Meaning |
|:---|:---|:---|
| `suosdey` | សួស្តី | Hello |
| `arkun` | អរគុណ | Thank you |
| `nhom` | ខ្ញុំ | I / me |
| `bat` | បាទ | Yes (male) |
| `cas` | ចាស | Yes (female) |
| `somtos` | សូមទោស | Sorry |

### Verbs

| Type | Get | Meaning |
|:---|:---|:---|
| `tov` | ទៅ | Go |
| `mok` | មក | Come |
| `nyam` | ញ៉ាំ | Eat |
| `thvoe` | ធ្វើ | Do / Make |
| `niyeay` | និយាយ | Speak |
| `moel` | មើល | Look / Watch |

### Phrases

| Type | Get | Meaning |
|:---|:---|:---|
| `soksabyteh` | សុខសប្បាយទេ | How are you? |
| `nhomtov` | ខ្ញុំទៅ | I go |
| `nhomjong` | ខ្ញុំចង់ | I want |
| `arkunchraen` | អរគុណច្រើន | Thank you very much |
| `tlaeyponman` | ថ្លៃប៉ុន្មាន | How much? |

### Places 

| Type | Get | Meaning |
|:---|:---|:---|
| `phnompenh` | ភ្នំពេញ | Phnom Penh |
| `kampuchea` | កម្ពុជា | Cambodia |
| `srokkhmer` | ស្រុកខ្មែរ | Cambodia (informal) |

---

## Contributing

The dictionary is the most important part of this project. If you know Khmer words that are missing, please add them!

Edit `xingkhmer.dict.yaml` and add a line (use **TAB** between columns):

```
ខ្មែរ	khmer	200
```

The number at the end is the weight — higher means it shows up first. Use `200` for regular words and `300` for phrases.

Then open a Pull Request.

---

## Built with

- [RIME 中州韻](https://rime.im) — input method engine
- [Squirrel 鼠鬚管](https://github.com/rime/squirrel) — macOS frontend
- [Weasel 小狼毫](https://github.com/rime/weasel) — Windows frontend

## License

[MIT](LICENSE)

---

Made for the Khmer community · poggers 
