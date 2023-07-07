//
//  HNModels.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import Foundation

// List of IDs where each ID represents an item
typealias Items = [Int]

struct ModelPreviews {
    static let StoryUrl = Item(id: 36575003, type: "story", by: "pseudolus", time: 1688400663, kids: [36575485, 36575492, 36575655, 36575512, 36575477, 36575738, 36575594, 36575478, 36575613, 36575688, 36575629, 36575484, 36575703, 36575668, 36575483, 36575660], url: "https://www.washingtonpost.com/technology/2023/07/01/amazon-goodreads-elizabeth-gilbert/", score: 61, title: "Goodreads was the future of book reviews. Then Amazon bought it", descendants: 26)

    static let StoryText = Item(id: 36609641, type: "story", by: "baron816", time: 1688606241, text: "Its acquirer (Bending Spoons) has taken over operations. They’ve also hiked subscriptions prices and told customers they intend to use new revenues to pay for new features. How they intend to do that without any staff is something I would like to know about.<p>If you’re still using Evernote, probably a good time to stop.", kids: [36610798, 36610242, 36616050, 36612514, 36611211, 36610305, 36610213, 36610795, 36621303, 36613488, 36613249, 36633801, 36610584, 36616007, 36614236, 36610156, 36610788, 36618085, 36615748, 36611231, 36611950, 36610612, 36616760, 36611647, 36613417, 36610513, 36610259, 36617875, 36615116, 36636311, 36629200, 36632040, 36611497, 36615865], title: "Tell HN: Nearly all of Evernote’s remaining staff has been laid off", descendants: 586)

    static let StoryUrlText = Item(id: 36613727, type: "story", by: "surprisetalk", time: 1688638516, text: "Like others on here, I was inspired by the &quot;personal blogs&quot; post :)<p>[0] <a href=\"https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=36575081\">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=36575081</a><p>In proper HN fashion, the site is open-source and requires no JS!<p>There&#x27;s instructions on how to add&#x2F;edit a blog on the Github README.<p>[1] <a href=\"https:&#x2F;&#x2F;github.com&#x2F;surprisetalk&#x2F;blogs.hn\">https:&#x2F;&#x2F;github.com&#x2F;surprisetalk&#x2F;blogs.hn</a><p>Note that your blog might appear in blogs.json, but not on the site! Right now I&#x27;m using the following code to filter out blogs. Your blog might appear if you add more metadata:<p><pre><code>  if (\n    3 &gt; 0  \n      + !!blog.title  \n      + (blog.desc.length &gt; 40)  \n      + !!blog.about  \n      + !!blog.now  \n      + !!blog.feed  \n      + 3 * (blog.hn.length &gt; 1)      \n  )\n    continue;\n</code></pre>\nAs I mention on the &#x2F;about page, if you don&#x27;t already have a blog, I recently made a minimal static site generator! It&#x27;s easier than ever to begin your writing journey :)<p>[2] <a href=\"https:&#x2F;&#x2F;github.com&#x2F;surprisetalk&#x2F;worstpress\">https:&#x2F;&#x2F;github.com&#x2F;surprisetalk&#x2F;worstpress</a>", kids: [36635335, 36637002, 36634592, 36635258, 36636765, 36625586, 36637292, 36636048, 36638128, 36636484, 36636963, 36635584], url: "https://blogs.hn", score: 141, title: "Show HN: Blogs.hn – tiny blog directory", descendants: 48)

    static let Comment = Item(id: 36610798, type: "comment", by: "belthesar", time: 1688614367, text: "I feel like Evernote is a prime example of the pains of trying to convert free users to paying users for the same features, something we see in many VC funded software from its era. Once you give something away, it&#x27;s damn near impossible to take it back, even if you plead your case as honestly as Evernote did.<p>Evernote was great. Honestly, it was worth paying for. But they gave away the farm too early, and folks feeling like what they had was being taken away from them spurned a lack of trust. Obsidian made the smartest play by giving you the editor, keeping the files outside of a database so that they&#x27;re portable (so they feel safe if they ever have to move away), and telling you that if you want to own the sync story that you can, but you can pay to have the cohesive experience on every device.", parent: 36609641, kids: [36614181, 36612020, 36611055, 36614960, 36614201, 36612068, 36611000, 36617348, 36610917, 36611862, 36627056, 36625640, 36625877, 36612822, 36614478, 36612021, 36612180, 36611014, 36613201, 36610832])

    static let Job = Item(id: 36638237, type: "job", by: "ankitdce", time: 1688763648, url: "https://www.ycombinator.com/companies/aviator/jobs", score: 1, title: "Aviator (YC S21) is hiring engineers to build the future of monorepos")
}
