# Український шаблон LaTeX для PhD рукопису (Ukrainian LaTeX PhD Thesis Template)

Сучасний шаблон LaTeX для оформлення дисертаційних робіт відповідно до вимог ВАК України. Підтримує UTF-8 кодування, сучасні інструменти для роботи з бібліографією та забезпечує простоту використання через Docker контейнеризацію.

*A modern LaTeX template for PhD thesis formatting according to Ukrainian Higher Attestation Commission (ВАК) requirements. Features UTF-8 support, modern bibliography tools, and simplified usage through Docker containerization.*

## Особливості (Features)

- **UTF-8 підтримка** — повна підтримка Unicode через `lualatex`
- **Сучасна бібліографія** — покращена обробка джерел за допомогою `biber`
- **Docker інтеграція** — легке налаштування та використання на будь-якій платформі
- **ВАК-сумісність** — стилі адаптовані під вимоги українських дисертаційних робіт

---

- **UTF-8 support** — full Unicode support via `lualatex`
- **Modern bibliography** — enhanced reference handling with `biber`
- **Docker integration** — easy setup and cross-platform compatibility
- **VAK compliance** — styles adapted to Ukrainian thesis requirements

## Подяка (Acknowledgements)

Цей шаблон базується на роботі **Олександра Барановського**, який створив оригінальні стилі для оформлення українських дисертаційних робіт. Оригінальні файли доступні за посиланням:

https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/mon2017dev/

Поточна версія містить адаптацію стилів (редакція ~2023 року) для роботи з UTF-8 кодуванням, `lualatex` та `biber`.

---

*This template is based on the work of **Oleksandr Baranovsky**, who created the original styles for Ukrainian thesis formatting. The current version includes adaptations (~2023 edition) for UTF-8 encoding, `lualatex`, and `biber` compatibility.*

## Швидкий старт (Quick Start)

### 0. Клонування репозиторію (Clone Repository)

Цей проект використовує git submodule для стилів `vakthesis`. При клонуванні використовуйте один з варіантів:

**Варіант А: Клонування з submodules одразу**
```sh
git clone --recurse-submodules git@github.com:gumby0q/phd_thesis_template.git
```

**Варіант Б: Якщо вже склонували без submodules**
```sh
git submodule init
git submodule update
```

**Варіант В: Оновлення submodule до останньої версії**
```sh
git submodule update --remote --merge
```

---

*This project uses git submodule for `vakthesis` styles. When cloning, use one of the following:*

**Option A: Clone with submodules**
```sh
git clone --recurse-submodules git@github.com:gumby0q/phd_thesis_template.git
```

**Option B: If already cloned without submodules**
```sh
git submodule init
git submodule update
```

**Option C: Update submodule to latest version**
```sh
git submodule update --remote --merge
```

### 1. Збірка Docker образу (Build Docker Image)

Створіть Docker образ з усіма необхідними залежностями:

```sh
docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t phd-thesis-texlive-image2 . -f Dockerfile.luatex
```

*Це потрібно зробити лише один раз. Образ буде містити всі необхідні пакети LaTeX та інструменти.*

### 2. Компіляція документу (Compile Document)

Для першої збірки або після оновлення бібліографії виконайте:

```sh
make lualatex   # Перша компіляція / First compilation
make biber      # Обробка бібліографії / Process bibliography
make lualatex   # Друга компіляція / Second compilation
make lualatex   # Фінальна компіляція / Final compilation
```

**Примітка:** Множинні виклики `lualatex` необхідні для коректного формування посилань, змісту та бібліографії.

**Note:** Multiple `lualatex` runs are required for proper cross-references, table of contents, and bibliography formatting.

### 3. Результат (Output)

Після успішної компіляції ви отримаєте файл `phd_thesis.pdf` у кореневій директорії проекту. 

## Details

----

## Docker solution
If you have docker you can use container from
https://gitlab.com/islandoftex/images/texlive

use similar `build approach` which written above

-   Put fonts into `./fonts` folder

-   Build image

    ```sh
    docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t phd-thesis-texlive-image2 . -f Dockerfile.luatex
    ```

### Docker usage
-   Use image
    ```sh
    docker run -i --rm --name latex -v "$PWD":/usr/src/app -e TEXINPUTS=.:./vakthesis//: -w /usr/src/app phd-thesis-texlive-image2 lualatex phd_thesis.tex
    ```

    ```sh
    docker run -i --rm --name latex -v "$PWD":/usr/src/app -e TEXINPUTS=.:./vakthesis//: -w /usr/src/app phd-thesis-texlive-image2 biber phd_thesis
    ```
--- 

### Old Trash Notes

cm-super
tlmgr --usermode install cm-super

Verify cm-super Installation
tlmgr list --only-installed

sudo chown -R anatolii /usr/local/texlive

Refresh File Name Database
mktexlsr


recash fonts Ubuntu:
fc-cache -f -v


fonts support
https://texdoc.org/serve/fontspec/0
% \setmainfont{Times New Roman}[
% % Extension = .ttf ,
% % UprightFont = *-regular ,
% ItalicFont = *-italic ,
% BoldFont = *-bold ,
% BoldItalicFont = *-bolditalic,
% ]


#### Tex live instalation

https://tug.org/texlive/quickinstall.html

issue https://tex.stackexchange.com/questions/528634/tlmgr-unexpected-return-value-from-verify-checksum-5

#### Install fonts
install fonts from `fonts` folder (Times New Roman)

hints for possible linux pathes for insystem fonts:
`/usr/share/fonts/`, `/usr/local/share/fonts/`, or `~/.local/share/fonts/`

#### Import classes
special styles for document
```sh
export TEXINPUTS=.:./vakthesis//:
```

#### Build approach

`lualatex` is used as modern tool which supports utf-8 encondig

`biber` is used as versatile tool to create bibliography for each chapter

_Note:_ commands should be called multiple times (latex build specifics)

```sh 
lualatex phd_thesis
biber phd_thesis
lualatex phd_thesis
lualatex phd_thesis
```
<!-- 
```sh 
pdflatex phd_thesis
biber phd_thesis
pdflatex phd_thesis
pdflatex phd_thesis
``` -->

